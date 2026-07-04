import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/core/domain/repository/profile_repository.dart';
import 'package:buzzwire/core/domain/entity/user_entity.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCachedUserUseCase implements UseCaseResult<UserEntity?, NoParams> {
  final ProfileRepository profileRepo;

  GetCachedUserUseCase({required this.profileRepo});
  @override
  Either<Failure, UserEntity?> call(NoParams param) {
    return profileRepo.getCachedUser();
  }
}
