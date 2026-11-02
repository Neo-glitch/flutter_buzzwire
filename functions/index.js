const { onSchedule } = require("firebase-functions/v2/scheduler");
const { defineBoolean } = require("firebase-functions/params");
const logger = require("firebase-functions/logger");
const { initializeApp } = require("firebase-admin/app");
const { getAuth } = require("firebase-admin/auth");
const { getFirestore } = require("firebase-admin/firestore");
const { getStorage } = require("firebase-admin/storage");

initializeApp();

// Paths must stay in sync with FirebaseCollectionConstants and
// ProfileRemoteDataSourceImpl.
const USERS = "users";
const DEVICES = "devices";
const PROFILE_IMAGES = "profile_images";

// Auth accounts younger than this are skipped: sign-up creates the Auth
// account a moment before the users doc.
const MIN_ACCOUNT_AGE_MS = 24 * 60 * 60 * 1000;

// Set in functions/.env. While true, the sweep only logs what it would delete.
const dryRun = defineBoolean("SWEEP_DRY_RUN", { default: true });

/**
 * Weekly sweep for data left behind by a partial account deletion. Run it on
 * demand with "Force run" in Google Cloud Console → Cloud Scheduler.
 *
 * - Auth account with no users doc (app deletion stopped before deleting the
 *   Auth account): delete the photo, devices doc and Auth account.
 * - users doc, devices doc or photo with no Auth account (e.g. user deleted
 *   from the Authentication console): delete them.
 */
exports.sweepOrphanedUsers = onSchedule(
  { schedule: "every monday 03:00", timeZone: "UTC", timeoutSeconds: 300 },
  async () => {
    const isDryRun = dryRun.value();
    const auth = getAuth();
    const db = getFirestore();
    const bucket = getStorage().bucket();

    const authUsers = await listAllAuthUsers(auth);
    const authUids = new Set(authUsers.map((user) => user.uid));

    // Auth accounts without a profile.
    const cutoff = Date.now() - MIN_ACCOUNT_AGE_MS;
    const oldEnough = authUsers.filter(
      (user) => Date.parse(user.metadata.creationTime) < cutoff,
    );
    const authOrphans = [];
    for (const batch of chunk(oldEnough, 100)) {
      const snaps = await db.getAll(
        ...batch.map((user) => db.doc(`${USERS}/${user.uid}`)),
      );
      snaps.forEach((snap, i) => {
        if (!snap.exists) authOrphans.push(batch[i].uid);
      });
    }

    // Data without an Auth account.
    const [userDocs, deviceDocs, [imageFiles]] = await Promise.all([
      db.collection(USERS).select().get(),
      db.collection(DEVICES).select().get(),
      bucket.getFiles({ prefix: `${PROFILE_IMAGES}/` }),
    ]);
    const dataUids = new Set([
      ...userDocs.docs.map((doc) => doc.id),
      ...deviceDocs.docs.map((doc) => doc.id),
      ...imageFiles.map((file) => file.name.slice(PROFILE_IMAGES.length + 1)),
    ]);
    const dataOrphans = [];
    for (const uid of dataUids) {
      // Re-check so a user who signed up during the sweep is never touched.
      if (uid && !authUids.has(uid) && !(await authUserExists(auth, uid))) {
        dataOrphans.push(uid);
      }
    }

    logger.info("Sweep found orphans", {
      dryRun: isDryRun,
      authWithoutProfile: authOrphans,
      dataWithoutAuth: dataOrphans,
    });
    if (isDryRun) return;

    for (const uid of authOrphans) {
      await deleteUserData(db, bucket, uid);
      await auth.deleteUser(uid);
    }
    for (const uid of dataOrphans) {
      await deleteUserData(db, bucket, uid);
    }
    logger.info("Sweep deleted orphans", {
      authAccounts: authOrphans.length,
      dataOnly: dataOrphans.length,
    });
  },
);

async function listAllAuthUsers(auth) {
  const users = [];
  let pageToken;
  do {
    const page = await auth.listUsers(1000, pageToken);
    users.push(...page.users);
    pageToken = page.pageToken;
  } while (pageToken);
  return users;
}

async function authUserExists(auth, uid) {
  try {
    await auth.getUser(uid);
    return true;
  } catch (e) {
    if (e.code === "auth/user-not-found") return false;
    throw e;
  }
}

function deleteUserData(db, bucket, uid) {
  return Promise.all([
    bucket.file(`${PROFILE_IMAGES}/${uid}`).delete({ ignoreNotFound: true }),
    db.doc(`${DEVICES}/${uid}`).delete(),
    db.doc(`${USERS}/${uid}`).delete(),
  ]);
}

function chunk(items, size) {
  const chunks = [];
  for (let i = 0; i < items.length; i += size) {
    chunks.push(items.slice(i, i + size));
  }
  return chunks;
}
