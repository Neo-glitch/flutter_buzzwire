import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/manager/local_user_manager.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';

class SaveEntryUseCase implements UseCaseFuture<bool, NoParams> {
  final LocalUserManager userManager;

  SaveEntryUseCase({required this.userManager});

  @override
  Future<Either<Failure, bool>> call(NoParams param) {
    return userManager.saveAppEntry();
  }
}
