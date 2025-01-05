import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/profile/domain/repository/profile_repository.dart';
import 'package:fpdart/fpdart.dart';

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
        return Left(FbFirestoreFailure("No user found with this email"));
      },
      (user) async {
        if (user == null) {
          return Left(FbFirestoreFailure("No user found with this email"));
        }

        await profileRepo.cacheUser(user);
        return const Right(unit);
      },
    );
  }
}
