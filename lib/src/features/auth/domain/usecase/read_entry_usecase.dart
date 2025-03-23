import 'package:fpdart/src/either.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../manager/local_user_manager.dart';

class ReadEntryUseCase implements UseCaseResult<bool, NoParams> {
  final LocalUserManager userManager;

  ReadEntryUseCase({required this.userManager});

  @override
  Either<Failure, bool> call(NoParams params) {
    return userManager.readAppEntry();
  }
}
