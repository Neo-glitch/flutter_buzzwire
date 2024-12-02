import 'dart:async';

import '../../../../../core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Stream<User?> authStateChanges();
  Future<Either<Failure, User>> signIn(String email, String password);
  Future<Either<Failure, User>> signUp(String email, String password);
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, bool>> verifyEmail();
  Future<Either<Failure, void>> sendVerificationEmail();
  Future<Either<Failure, void>> resetPassword(String email);

  bool checkIfAunthenticated();
}
