import 'dart:core';

import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/repository/auth_repository.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
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
