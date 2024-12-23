import 'package:fpdart/src/either.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../manager/local_user_manager.dart';

class ReadEntry implements UseCaseResult<bool, NoParams> {
  final LocalUserManager userManager;

  ReadEntry({required this.userManager});

  @override
  Either<Failure, bool> call(NoParams params) {
    return userManager.readAppEntry();
  }
}
