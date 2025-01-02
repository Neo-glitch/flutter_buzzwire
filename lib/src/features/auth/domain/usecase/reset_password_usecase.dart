import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class ResetPasswordUseCase implements UseCaseFutureVoid<ResetPasswordParams> {
  final AuthRepository authRepo;

  ResetPasswordUseCase({required this.authRepo});

  @override
  Future<Either<Failure, void>> call(ResetPasswordParams param) async {
    return authRepo.resetPassword(param.email);
  }
}

class ResetPasswordParams {
  final String email;

  ResetPasswordParams({required this.email});
}
