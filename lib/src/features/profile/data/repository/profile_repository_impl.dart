import 'dart:io';

import 'package:buzzwire/core/error/error_text.dart';
import 'package:buzzwire/core/error/exception_handler.dart';
import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/network/network_connection_checker.dart';
import 'package:buzzwire/src/features/profile/data/datasources/local/profle_local_datasource.dart';
import 'package:buzzwire/src/features/profile/data/datasources/remote/profile_remote_datasource.dart';
import 'package:buzzwire/src/features/profile/data/mapper/profile_image_mapper.dart';
import 'package:buzzwire/src/features/profile/data/mapper/user_mapper.dart';
import 'package:buzzwire/src/features/profile/domain/repository/profile_repository.dart';
import 'package:buzzwire/src/shared/domain/entity/profile_image_entity.dart';
import 'package:buzzwire/src/shared/domain/entity/user_entity.dart';
import 'package:fpdart/fpdart.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDatasource;
  final ProfileLocalDataSource localDatasource;
  final NetworkConnectionChecker networkConnectionChecker;

  ProfileRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
    required this.networkConnectionChecker,
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
      final isConnected = await networkConnectionChecker.isConnected;
      if (isConnected) {
        final userModel = UserMapper.fromEntity(userEntity);
        await remoteDatasource.createUser(userModel!);
        await localDatasource.saveUser(userModel);
        return const Right(unit);
      }
      return Left(FbFailure(ErrorText.noInternetError));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser(UserEntity userEntity) async {
    try {
      final isConnected = await networkConnectionChecker.isConnected;
      if (isConnected) {
        final userModel = UserMapper.fromEntity(userEntity);
        await remoteDatasource.deleteUser(userModel!);
        await clearCachedUser();
        return const Right(unit);
      }
      return Left(FbFailure(ErrorText.noInternetError));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbFailure(exception.toString()));
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
      final isConnected = await networkConnectionChecker.isConnected;
      if (isConnected) {
        final userModel = await remoteDatasource.getUser(userId);
        return Right(UserMapper.fromModel(userModel));
      }
      return Left(FbFailure(ErrorText.noInternetError));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(UserEntity userEntity) async {
    try {
      final isConnected = await networkConnectionChecker.isConnected;
      if (isConnected) {
        final userModel = UserMapper.fromEntity(userEntity);
        await remoteDatasource.updateUser(userModel!);
        await localDatasource.saveUser(userModel);
        return const Right(unit);
      }
      return Left(FbFailure(ErrorText.noInternetError));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileImageEntity>> uploadProfileImage(
      UserEntity user, File image) async {
    try {
      final isConnected = await networkConnectionChecker.isConnected;
      if (isConnected) {
        final userModel = UserMapper.fromEntity(user);
        final profileImage =
            await remoteDatasource.uploadProfileImage(userModel!, image);
        return Right(ProfileImageMapper.fromModel(profileImage)!);
      }
      return Left(FbFailure(ErrorText.noInternetError));
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
