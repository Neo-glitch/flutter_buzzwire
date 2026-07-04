import 'package:buzzwire/core/data/datasource/auth/auth_remote_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Stream<User?> authStateChanges() => firebaseAuth.authStateChanges();

  @override
  Future<User> signIn(String email, String password) async {
    final response = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return response.user!;
  }

  @override
  Future<void> signOut() async {
    return await firebaseAuth.signOut();
  }

  @override
  Future<User> signup(String email, String password) async {
    final response = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return response.user!;
  }

  @override
  Future<void> resetPassword(String email) {
    return firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<bool> verifyEmail() async {
    await firebaseAuth.currentUser?.reload();
    return firebaseAuth.currentUser?.emailVerified ?? false;
  }

  @override
  Future<void> sendVerificationEmail() async {
    await firebaseAuth.currentUser?.sendEmailVerification();
  }

  @override
  Future<void> deleteAccount() async {
    await firebaseAuth.currentUser?.delete();
  }

  @override
  Future<void> changePassword(String newPassword) async {
    await firebaseAuth.currentUser?.updatePassword(newPassword);
  }

  @override
  Future<void> reAuthenticateUser(String email, String password) async {
    final credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );

    final currentUser = firebaseAuth.currentUser;
    await currentUser?.reauthenticateWithCredential(credential);
  }
}
