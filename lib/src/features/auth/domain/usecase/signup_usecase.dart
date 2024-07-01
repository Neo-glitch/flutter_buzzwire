import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:buzzwire/src/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/src/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_usecase.g.dart';

@riverpod
SignUp signUp(SignUpRef ref) {
  return SignUp(authRepo: ref.read(authRepositoryProvider));
}

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
