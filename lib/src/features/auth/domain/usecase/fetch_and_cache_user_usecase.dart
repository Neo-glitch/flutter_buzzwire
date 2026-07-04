import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/core/domain/repository/profile_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchAndCacheUserUseCase implements UseCaseFuture<void, String> {
  final ProfileRepository profileRepo;

  FetchAndCacheUserUseCase({
    required this.profileRepo,
  });

  @override
  Future<Either<Failure, void>> call(String userId) async {
    final userResult = await profileRepo.getUser(userId);
    return userResult.fold(
      (failure) async {
        return Left(FbFailure("No user found with this email"));
      },
      (user) async {
        if (user == null) {
          return Left(FbFailure("No user found with this email"));
        }

        await profileRepo.cacheUser(user);
        return const Right(unit);
      },
    );
  }
}
