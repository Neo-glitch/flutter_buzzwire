import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/core/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckEmailVerificationStatusUseCase
    implements UseCaseFuture<bool, NoParams> {
  final AuthRepository authRepo;

  CheckEmailVerificationStatusUseCase({required this.authRepo});

  @override
  Future<Either<Failure, bool>> call(NoParams param) async {
    return authRepo.verifyEmail();
  }
}
