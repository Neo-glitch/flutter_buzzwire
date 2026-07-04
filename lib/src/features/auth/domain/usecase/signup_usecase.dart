import 'package:buzzwire/core/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/domain/entity/error/failure.dart';
import '../../../../../core/domain/usecase/usecase.dart';

@injectable
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

  SignUpParams({
    required this.email,
    required this.password,
  });
}
