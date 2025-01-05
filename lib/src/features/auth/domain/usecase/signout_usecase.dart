import 'package:buzzwire/src/features/profile/domain/repository/profile_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/src/either.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class SignOutUseCase implements UseCaseFutureVoid<NoParams> {
  final AuthRepository authRepo;
  final ProfileRepository profileRepo;

  SignOutUseCase({required this.authRepo, required this.profileRepo});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    await authRepo.signOut();
    await profileRepo.clearCachedUser();
    return const Right(unit);
  }
}
