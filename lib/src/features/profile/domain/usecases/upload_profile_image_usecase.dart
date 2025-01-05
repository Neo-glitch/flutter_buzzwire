import 'dart:io';

import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/profile/domain/repository/profile_repository.dart';
import 'package:fpdart/src/either.dart';

class UploadProfileImageUseCase
    implements UseCaseFuture<String, UploadProfileImageParams> {
  final ProfileRepository profileRepo;

  UploadProfileImageUseCase({
    required this.profileRepo,
  });

  @override
  Future<Either<Failure, String>> call(UploadProfileImageParams param) {
    return profileRepo.uploadProfileImage(param.userId, param.image);
  }
}

class UploadProfileImageParams {
  final String userId;
  final File image;

  UploadProfileImageParams({required this.userId, required this.image});
}
