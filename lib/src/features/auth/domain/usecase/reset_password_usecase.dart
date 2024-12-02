import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:buzzwire/src/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reset_password_usecase.g.dart';

@riverpod
ResetPassword resetPassword(ResetPasswordRef ref) {
  return ResetPassword(authRepo: ref.read(authRepositoryProvider));
}

class ResetPassword implements UseCaseFutureVoid<ResetPasswordParams> {
  final AuthRepository authRepo;

  ResetPassword({required this.authRepo});

  @override
  Future<Either<Failure, void>> call(ResetPasswordParams param) async {
    return authRepo.resetPassword(param.email);
  }
}

class ResetPasswordParams {
  final String email;

  ResetPasswordParams({required this.email});
}
