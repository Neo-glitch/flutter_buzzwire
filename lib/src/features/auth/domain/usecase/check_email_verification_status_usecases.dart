import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class CheckEmailVerificationStatusUseCase
    implements UseCaseFuture<bool, NoParams> {
  final AuthRepository authRepo;

  CheckEmailVerificationStatusUseCase({required this.authRepo});

  @override
  Future<Either<Failure, bool>> call(NoParams param) async {
    return authRepo.verifyEmail();
  }
}
