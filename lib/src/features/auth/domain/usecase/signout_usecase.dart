import 'package:fpdart/src/either.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class SignOut implements UseCaseFutureVoid<NoParams> {
  final AuthRepository authRepo;

  SignOut({required this.authRepo});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return authRepo.signOut();
  }
}
