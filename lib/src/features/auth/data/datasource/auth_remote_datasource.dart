import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/utils/logging/logger_helper.dart';

abstract class AuthRemoteDataSource {
  Stream<User?> authStateChanges();
  Future<User> signIn(String email, String password);
  Future<User> signup(String email, String password);
  Future<void> signOut();
  Future<bool> verifyEmail();
  Future<void> sendVerificationEmail();
  Future<void> resetPassword(String emauil);
  Future<void> deleteAccount();
  Future<void> changePassword(String newPassword);
  Future<void> reAuthenticateUser(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Stream<User?> authStateChanges() => firebaseAuth.authStateChanges();

  @override
  Future<User> signIn(String email, String password) async {
    try {
      final response = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return response.user!;
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      return await firebaseAuth.signOut();
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<User> signup(String email, String password) async {
    try {
      final response = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return response.user!;
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) {
    try {
      return firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<bool> verifyEmail() async {
    try {
      // reload to get latest loggedin user detail and verify is email is verified
      await firebaseAuth.currentUser?.reload();
      return firebaseAuth.currentUser?.emailVerified ?? false;
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<void> sendVerificationEmail() async {
    try {
      await firebaseAuth.currentUser?.sendEmailVerification();
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteAccount() async {
    try {
      await firebaseAuth.currentUser?.delete();
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<void> changePassword(String newPassword) async {
    try {
      await firebaseAuth.currentUser?.updatePassword(newPassword);
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<void> reAuthenticateUser(String email, String password) async {
    try {
      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      final currentUser = firebaseAuth.currentUser;
      await currentUser?.reauthenticateWithCredential(credential);
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }
}
