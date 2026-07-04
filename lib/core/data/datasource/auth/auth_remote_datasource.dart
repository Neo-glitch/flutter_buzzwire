import 'package:firebase_auth/firebase_auth.dart';

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
