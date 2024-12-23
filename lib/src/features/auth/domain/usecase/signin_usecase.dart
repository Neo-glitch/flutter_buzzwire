import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/src/either.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class SignIn implements UseCaseFuture<User, SignInParams> {
  final AuthRepository authRepo;

  SignIn({required this.authRepo});

  @override
  Future<Either<Failure, User>> call(SignInParams params) async {
    return authRepo.signIn(params.email, params.password);
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({required this.email, required this.password});
}
