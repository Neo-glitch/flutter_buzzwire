import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/auth/data/manager/local_user_manager_impl.dart';
import 'package:buzzwire/src/features/auth/domain/manager/local_user_manager.dart';
import 'package:fpdart/src/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_entry_usecase.g.dart';

@riverpod
SaveEntry saveEntry(SaveEntryRef ref) =>
    SaveEntry(userManager: ref.read(localUserManagerProvider));

class SaveEntry implements UseCaseFuture<bool, NoParams> {
  final LocalUserManager userManager;

  SaveEntry({required this.userManager});

  @override
  Future<Either<Failure, bool>> call(NoParams param) {
    return userManager.saveAppEntry();
  }
}
