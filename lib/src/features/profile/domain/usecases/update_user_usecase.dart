import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/profile/domain/repository/profile_repository.dart';
import 'package:buzzwire/src/shared/domain/entity/user_entity.dart';
import 'package:fpdart/src/either.dart';

class UpdateUserUseCase implements UseCaseFutureVoid<UserEntity> {
  final ProfileRepository profileRepo;

  UpdateUserUseCase({required this.profileRepo});

  @override
  Future<Either<Failure, void>> call(UserEntity param) {
    return profileRepo.updateUser(param);
  }
}
