import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/src/features/profile/domain/repository/profile_repository.dart';
import 'package:fpdart/src/either.dart';

class DisposeCachedUserStreamUseCase implements UseCaseResult<void, NoParams> {
  final ProfileRepository profileRepo;

  DisposeCachedUserStreamUseCase({required this.profileRepo});

  @override
  Either<Failure, void> call(NoParams param) {
    return Right(profileRepo.disposeUserStream());
  }
}
