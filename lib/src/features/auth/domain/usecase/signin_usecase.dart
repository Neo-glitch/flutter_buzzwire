import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:buzzwire/src/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/src/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signin_usecase.g.dart';

@riverpod
SignIn signIn(SignInRef ref) {
  return SignIn(authRepo: ref.read(authRepositoryProvider));
}

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
