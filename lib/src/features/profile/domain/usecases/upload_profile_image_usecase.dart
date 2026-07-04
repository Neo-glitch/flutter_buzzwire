import 'dart:io';

import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/core/domain/repository/profile_repository.dart';
import 'package:buzzwire/core/domain/entity/profile_image_entity.dart';
import 'package:buzzwire/core/domain/entity/user_entity.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class UploadProfileImageUseCase
    implements UseCaseFuture<ProfileImageEntity, UploadProfileImageParams> {
  final ProfileRepository profileRepo;

  UploadProfileImageUseCase({
    required this.profileRepo,
  });

  @override
  Future<Either<Failure, ProfileImageEntity>> call(
      UploadProfileImageParams param) {
    return profileRepo.uploadProfileImage(param.user, param.image);
  }
}

class UploadProfileImageParams {
  final UserEntity user;
  final File image;

  UploadProfileImageParams({required this.user, required this.image});
}
