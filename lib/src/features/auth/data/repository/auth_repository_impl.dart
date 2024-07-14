import '../../../../../core/error/exception_handler.dart';
import '../../../../../core/error/failure.dart';
import '../datasource/auth_remote_datasource.dart';
import '../../domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/src/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_impl.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
      authRemoteDataSource: ref.read(authRemoteDataSourceProvider));
  ;
}

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
      final user = await authRemoteDataSource.signIn(email, password);
      return Right(user);
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbAuthFailure(exception.toString()));
    }
  }
}
