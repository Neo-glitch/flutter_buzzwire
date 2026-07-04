import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/core/domain/repository/profile_repository.dart';
import 'package:buzzwire/core/domain/entity/user_entity.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateUserUseCase implements UseCaseFutureVoid<UserEntity> {
  final ProfileRepository profileRepo;

  UpdateUserUseCase({required this.profileRepo});

  @override
  Future<Either<Failure, void>> call(UserEntity param) {
    return profileRepo.updateUser(param);
  }
}
