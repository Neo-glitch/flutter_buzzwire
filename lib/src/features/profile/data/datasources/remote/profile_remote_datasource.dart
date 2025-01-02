import 'dart:io';

import 'package:buzzwire/core/network/firebase_firestore/firebase_firestore_helper.dart';
import 'package:buzzwire/core/network/supabase/supabase_helper.dart';
import 'package:buzzwire/core/utils/logging/logger_helper.dart';
import 'package:buzzwire/src/shared/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ProfileRemoteDataSource {
  Future<void> createUser(UserModel userModel);
  Future<void> updateUser(UserModel userModel);
  Future<UserModel?> getUser(String userId);
  Future<void> deleteUser(UserModel userModel);
  Future<String> uploadProfileImage(String userId, File image);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseFirestore firestoreDb;
  final SupabaseStorageClient supabaseStorage;

  ProfileRemoteDataSourceImpl({
    required this.firestoreDb,
    required this.supabaseStorage,
  });

  @override
  Future<void> createUser(UserModel userModel) async {
    try {
      final docRef = _getUsersCollectionRef
          .withConverter(
            fromFirestore: UserModel.fromFirestore,
            toFirestore: (userModel, options) => userModel.toFirestore(),
          )
          .doc(userModel.userId);
      await docRef.set(userModel);
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteUser(UserModel userModel) async {
    try {
      final imagePath =
          "${SupabaseHelper.imageBucketProfilePath}/${userModel.userId}.png";

      await supabaseStorage.from(SupabaseHelper.imagesBucket).remove(
        [
          imagePath,
        ],
      );
      await _getUsersCollectionRef.doc(userModel.userId).delete();
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<UserModel?> getUser(String userId) async {
    try {
      final docRef = _getUsersCollectionRef
          .withConverter(
            fromFirestore: UserModel.fromFirestore,
            toFirestore: (userModel, options) => userModel.toFirestore(),
          )
          .doc(userId);
      // set source to just server to get the latest doc saved in server, else throw error
      final userModelDocSnap =
          await docRef.get(const GetOptions(source: Source.server));
      return userModelDocSnap.data();
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<void> updateUser(UserModel userModel) async {
    try {
      final docRef = _getUsersCollectionRef
          .withConverter(
            fromFirestore: UserModel.fromFirestore,
            toFirestore: (userModel, options) => userModel.toFirestore(),
          )
          .doc(userModel.userId);
      await docRef.set(userModel);
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<String> uploadProfileImage(String userId, File image) async {
    try {
      final imagePath = "${SupabaseHelper.imageBucketProfilePath}/$userId.png";
      await supabaseStorage.from(SupabaseHelper.imagesBucket).upload(
            imagePath,
            image,
            fileOptions: const FileOptions(
              cacheControl: '3',
              upsert: true,
              contentType: "image/*",
            ),
          );
      String imageUrl = supabaseStorage
          .from(SupabaseHelper.imagesBucket)
          .getPublicUrl(imagePath);

      // to get updated image in url due to catch
      // imageUrl = Uri.parse(imageUrl).replace(queryParameters: {
      //   "t": DateTime.now().millisecondsSinceEpoch.toString()
      // }).toString();
      return imageUrl;
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  CollectionReference<Map<String, dynamic>> get _getUsersCollectionRef =>
      firestoreDb.collection(FirebaseFirestoreHelper.usersCollecton);
}
