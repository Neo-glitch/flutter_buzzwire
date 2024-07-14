import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../data/manager/local_user_manager_impl.dart';
import '../manager/local_user_manager.dart';
import 'package:fpdart/src/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'read_entry_usecase.g.dart';

@riverpod
ReadEntry readEntry(ReadEntryRef ref) =>
    ReadEntry(userManager: ref.read(localUserManagerProvider));

class ReadEntry implements UseCaseResult<bool, NoParams> {
  final LocalUserManager userManager;

  ReadEntry({required this.userManager});

  @override
  Either<Failure, bool> call(NoParams params) {
    return userManager.readAppEntry();
  }
}
