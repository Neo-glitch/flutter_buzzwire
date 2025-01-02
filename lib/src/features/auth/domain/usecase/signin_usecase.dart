import 'package:buzzwire/src/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';

class SignInUseCase implements UseCaseFuture<User, SignInParams> {
  final AuthRepository authRepo;

  SignInUseCase({
    required this.authRepo,
  });

  @override
  Future<Either<Failure, User>> call(SignInParams params) async {
    return await authRepo.signIn(params.email, params.password);
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({required this.email, required this.password});
}
