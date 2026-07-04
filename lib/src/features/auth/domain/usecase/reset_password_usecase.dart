import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/core/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';

@injectable
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
