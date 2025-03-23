import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/profile/domain/repository/profile_repository.dart';
import 'package:buzzwire/src/shared/domain/entity/user_entity.dart';
import 'package:fpdart/src/either.dart';

class GetRemoteOrLocalUserUseCase
    implements UseCaseFuture<UserEntity?, String> {
  final ProfileRepository profileRepo;

  GetRemoteOrLocalUserUseCase({required this.profileRepo});

  @override
  Future<Either<Failure, UserEntity?>> call(String userId) async {
    final remoteUserResult = await profileRepo.getUser(userId);
    final remoteUser = remoteUserResult.getOrElse((l) => null);

    if (remoteUser == null) {
      return profileRepo.getCachedUser();
    }
    return Right(remoteUser);
  }
}
