import 'package:fpdart/src/either.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../manager/local_user_manager.dart';

class SaveEntry implements UseCaseFuture<bool, NoParams> {
  final LocalUserManager userManager;

  SaveEntry({required this.userManager});

  @override
  Future<Either<Failure, bool>> call(NoParams param) {
    return userManager.saveAppEntry();
  }
}
