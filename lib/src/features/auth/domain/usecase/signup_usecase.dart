import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/src/either.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class SignUp implements UseCaseFuture<User, SignUpParams> {
  final AuthRepository authRepo;

  SignUp({required this.authRepo});

  @override
  Future<Either<Failure, User>> call(SignUpParams params) async {
    return authRepo.signUp(params.email, params.password);
  }
}

class SignUpParams {
  final String email;
  final String password;

  SignUpParams({required this.email, required this.password});
}
