import 'dart:core';

import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class ReAuthenticateUserUseCase
    implements UseCaseFutureVoid<ReAuthtenticateUserParam> {
  final AuthRepository authRepo;

  ReAuthenticateUserUseCase({required this.authRepo});

  @override
  Future<Either<Failure, void>> call(ReAuthtenticateUserParam param) async {
    return await authRepo.reAuthenticateUser(param.email, param.password);
  }
}

class ReAuthtenticateUserParam {
  final String email;
  final String password;

  ReAuthtenticateUserParam({required this.email, required this.password});
}
