import '../../../../../core/utils/logging/logger_helper.dart';
import '../../presentation/signin/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_remote_datasource.g.dart';

abstract class AuthRemoteDataSource {
  Stream<User?> authStateChanges();
  Future<User> signIn(String email, String password);
  Future<User> signup(String email, String password);
  Future<void> signOut();
  Future<bool> verifyEmail();
  Future<void> sendVerificationEmail();
  Future<void> resetPassword(String emauil);
}

@riverpod
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  return AuthRemoteDataSourceImpl(firebaseAuth: FirebaseAuth.instance);
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
}
