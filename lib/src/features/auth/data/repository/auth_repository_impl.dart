import 'package:buzzwire/core/error/error_text.dart';
import 'package:buzzwire/core/network/network_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/src/either.dart';

import '../../../../../core/error/exception_handler.dart';
import '../../../../../core/error/failure.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkConnectionChecker networkConnectionChecker;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.networkConnectionChecker,
  });

  @override
  bool checkIfAunthenticated() {
    return false;
  }

  @override
  Stream<User?> authStateChanges() => authRemoteDataSource.authStateChanges();

  @override
  Future<Either<Failure, User>> signIn(String email, String password) async {
    try {
      final isConnected = await networkConnectionChecker.isConnected;
      if (isConnected) {
        return Right(await authRemoteDataSource.signIn(email, password));
      }
      return Left(FbAuthFailure(ErrorText.noInternetError));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbAuthFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      return Right(await authRemoteDataSource.signOut());
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbAuthFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signUp(String email, String password) async {
    try {
      final isConnected = await networkConnectionChecker.isConnected;
      if (isConnected) {
        return Right(await authRemoteDataSource.signup(email, password));
      }
      return Left(FbAuthFailure(ErrorText.noInternetError));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbAuthFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      final isConnected = await networkConnectionChecker.isConnected;
      if (isConnected) {
        final response = await authRemoteDataSource.resetPassword(email);
        return Right(response);
      }
      return Left(FbAuthFailure(ErrorText.noInternetError));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbAuthFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendVerificationEmail() async {
    try {
      final isConnected = await networkConnectionChecker.isConnected;
      if (isConnected) {
        final response = await authRemoteDataSource.sendVerificationEmail();
        return Right(response);
      }
      return Left(FbAuthFailure(ErrorText.noInternetError));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbAuthFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> verifyEmail() async {
    try {
      final isConnected = await networkConnectionChecker.isConnected;
      if (isConnected) {
        final response = await authRemoteDataSource.verifyEmail();
        return Right(response);
      }
      return Left(FbAuthFailure(ErrorText.noInternetError));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbAuthFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount() async {
    try {
      final isConnected = await networkConnectionChecker.isConnected;
      if (isConnected) {
        return Right(await authRemoteDataSource.deleteAccount());
      }
      return Left(FbAuthFailure(ErrorText.noInternetError));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbAuthFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword(String newPassword) async {
    try {
      final isConnected = await networkConnectionChecker.isConnected;
      if (isConnected) {
        return Right(await authRemoteDataSource.changePassword(newPassword));
      }
      return Left(FbAuthFailure(ErrorText.noInternetError));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbAuthFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> reAuthenticateUser(
      String email, String password) async {
    try {
      final isConnected = await networkConnectionChecker.isConnected;
      if (isConnected) {
        return Right(
            await authRemoteDataSource.reAuthenticateUser(email, password));
      }
      return Left(FbAuthFailure(ErrorText.noInternetError));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbAuthFailure(exception.toString()));
    }
  }
}
