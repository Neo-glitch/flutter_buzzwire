import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/src/either.dart';

import '../../../../../core/error/exception_handler.dart';
import '../../../../../core/error/failure.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  bool checkIfAunthenticated() {
    return false;
  }

  @override
  Stream<User?> authStateChanges() => authRemoteDataSource.authStateChanges();

  @override
  Future<Either<Failure, User>> signIn(String email, String password) async {
    try {
      final user = await authRemoteDataSource.signIn(email, password);
      return Right(user);
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbAuthFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final response = await authRemoteDataSource.signOut();
      return Right(response);
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbAuthFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signUp(String email, String password) async {
    try {
      final user = await authRemoteDataSource.signup(email, password);
      return Right(user);
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbAuthFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      final response = await authRemoteDataSource.resetPassword(email);
      return Right(response);
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbAuthFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendVerificationEmail() async {
    try {
      final response = await authRemoteDataSource.sendVerificationEmail();
      return Right(response);
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbAuthFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> verifyEmail() async {
    try {
      final response = await authRemoteDataSource.verifyEmail();
      return Right(response);
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbAuthFailure(exception.toString()));
    }
  }
}
