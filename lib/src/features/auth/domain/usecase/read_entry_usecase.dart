import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/auth/data/manager/local_user_manager_impl.dart';
import 'package:buzzwire/src/features/auth/domain/manager/local_user_manager.dart';
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
