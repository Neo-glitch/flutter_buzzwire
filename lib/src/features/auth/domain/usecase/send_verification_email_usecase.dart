import 'package:buzzwire/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:fpdart/src/either.dart';
import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/auth/domain/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'send_verification_email_usecase.g.dart';

@riverpod
SendVerificationEmail sendVerificationEmail(SendVerificationEmailRef ref) {
  return SendVerificationEmail(authRepo: ref.read(authRepositoryProvider));
}

class SendVerificationEmail implements UseCaseFutureVoid<NoParams> {
  final AuthRepository authRepo;
  SendVerificationEmail({required this.authRepo});

  @override
  Future<Either<Failure, void>> call(NoParams param) {
    return authRepo.sendVerificationEmail();
  }
}
