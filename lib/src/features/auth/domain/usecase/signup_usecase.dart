import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class SignUpUseCase implements UseCaseFuture<User, SignUpParams> {
  final AuthRepository authRepo;

  SignUpUseCase({
    required this.authRepo,
  });

  @override
  Future<Either<Failure, User>> call(SignUpParams params) async {
    return await authRepo.signUp(params.email, params.password);
  }
}

class SignUpParams {
  final String email;
  final String password;
  final String userName;

  SignUpParams({
    required this.email,
    required this.password,
    required this.userName,
  });
}
