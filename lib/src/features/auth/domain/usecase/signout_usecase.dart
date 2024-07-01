import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:buzzwire/src/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/src/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signout_usecase.g.dart';

@riverpod
SignOut signOut(SignOutRef ref) =>
    SignOut(authRepo: ref.read(authRepositoryProvider));

class SignOut implements UseCaseFutureVoid<NoParams> {
  final AuthRepository authRepo;

  SignOut({required this.authRepo});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return authRepo.signOut();
  }
}
