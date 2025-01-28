import 'dart:io';

import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/src/shared/domain/entity/profile_image_entity.dart';
import 'package:buzzwire/src/shared/domain/entity/user_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserEntity?>> getUser(String userId);
  Either<Failure, UserEntity?> getCachedUser();
  Future<Either<Failure, void>> updateUser(UserEntity userEntity);
  Future<Either<Failure, void>> cacheUser(UserEntity userEntity);
  Future<Either<Failure, void>> deleteUser(UserEntity userEntity);
  Future<Either<Failure, void>> clearCachedUser();
  Future<Either<Failure, void>> createUser(UserEntity userEntity);
  Future<Either<Failure, ProfileImageEntity>> uploadProfileImage(
      UserEntity user, File image);
  Stream<Either<Failure, UserEntity?>> get userStream;
  void disposeUserStream();
}
