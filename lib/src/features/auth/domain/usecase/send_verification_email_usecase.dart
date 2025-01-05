import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class SendVerificationEmailUseCase implements UseCaseFutureVoid<NoParams> {
  final AuthRepository authRepo;

  SendVerificationEmailUseCase({required this.authRepo});

  @override
  Future<Either<Failure, void>> call(NoParams param) async {
    return await authRepo.sendVerificationEmail();
  }
}
