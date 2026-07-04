import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/manager/local_user_manager.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';

class ReadEntryUseCase implements UseCaseResult<bool, NoParams> {
  final LocalUserManager userManager;

  ReadEntryUseCase({required this.userManager});

  @override
  Either<Failure, bool> call(NoParams params) {
    return userManager.readAppEntry();
  }
}
