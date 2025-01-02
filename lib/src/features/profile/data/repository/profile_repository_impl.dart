import 'dart:io';

import 'package:buzzwire/core/error/exception_handler.dart';
import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/src/features/profile/data/datasources/local/profle_local_datasource.dart';
import 'package:buzzwire/src/features/profile/data/datasources/remote/profile_remote_datasource.dart';
import 'package:buzzwire/src/features/profile/data/mapper/user_mapper.dart';
import 'package:buzzwire/src/features/profile/domain/repository/profile_repository.dart';
import 'package:buzzwire/src/shared/domain/entity/user_entity.dart';
import 'package:fpdart/fpdart.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDatasource;
  final ProfileLocalDataSource localDatasource;

  ProfileRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  @override
  Future<Either<Failure, void>> clearCachedUser() async {
    try {
      return Right(localDatasource.clearUser());
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(CacheFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> createUser(UserEntity userEntity) async {
    try {
      final userModel = UserMapper.fromEntity(userEntity);
      await remoteDatasource.createUser(userModel!);
      await localDatasource.saveUser(userModel);
      return const Right(unit);
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbFirestoreFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser(UserEntity userEntity) async {
    try {
      final userModel = UserMapper.fromEntity(userEntity);
      await remoteDatasource.deleteUser(userModel!);
      await clearCachedUser();
      return const Right(unit);
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbFirestoreFailure(exception.toString()));
    }
  }

  @override
  Either<Failure, UserEntity?> getCachedUser() {
    try {
      final userModel = localDatasource.getUser();
      return Right(UserMapper.fromModel(userModel));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(CacheFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getUser(String userId) async {
    try {
      final userModel = await remoteDatasource.getUser(userId);
      return Right(UserMapper.fromModel(userModel));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbFirestoreFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(UserEntity userEntity) async {
    try {
      final userModel = UserMapper.fromEntity(userEntity);
      await remoteDatasource.updateUser(userModel!);
      await localDatasource.saveUser(userModel);
      return const Right(unit);
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbFirestoreFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfileImage(
      String userId, File image) async {
    try {
      final imageUrl = await remoteDatasource.uploadProfileImage(userId, image);
      return Right(imageUrl);
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(SupabaseStorageFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheUser(UserEntity userEntity) async {
    try {
      final userModel = UserMapper.fromEntity(userEntity);
      return Right(await localDatasource.saveUser(userModel!));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(CacheFailure(exception.toString()));
    }
  }

  @override
  void disposeUserStream() {
    localDatasource.disposeUserStream();
  }

  @override
  Stream<Either<Failure, UserEntity?>> get userStream =>
      localDatasource.userStream.map(
        (userModel) => Right(UserMapper.fromModel(userModel)),
      );
}
