import 'package:fpdart/src/either.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../manager/local_user_manager.dart';

class SaveEntryUseCase implements UseCaseFuture<bool, NoParams> {
  final LocalUserManager userManager;

  SaveEntryUseCase({required this.userManager});

  @override
  Future<Either<Failure, bool>> call(NoParams param) {
    return userManager.saveAppEntry();
  }
}
