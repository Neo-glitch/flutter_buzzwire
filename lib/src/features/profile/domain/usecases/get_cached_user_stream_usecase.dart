import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/core/domain/repository/profile_repository.dart';
import 'package:buzzwire/core/domain/entity/user_entity.dart';
import 'package:fpdart/src/either.dart';

class GetCachedUserStreamUseCase
    implements UseCaseStream<UserEntity?, NoParams> {
  final ProfileRepository profileRepo;

  GetCachedUserStreamUseCase({required this.profileRepo});

  @override
  Stream<Either<Failure, UserEntity?>> call(NoParams param) {
    return profileRepo.userStream;
  }
}
