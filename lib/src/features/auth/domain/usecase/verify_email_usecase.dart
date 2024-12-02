import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:buzzwire/src/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verify_email_usecase.g.dart';

@riverpod
VerifyEmail verifyEmail(VerifyEmailRef ref) {
  return VerifyEmail(authRepo: ref.read(authRepositoryProvider));
}

class VerifyEmail implements UseCaseFuture<bool, NoParams> {
  final AuthRepository authRepo;

  VerifyEmail({required this.authRepo});

  @override
  Future<Either<Failure, bool>> call(NoParams param) async {
    return authRepo.verifyEmail();
  }
}
