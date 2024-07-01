import 'package:buzzwire/core/constants/preference_keys.dart';
import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/utils/local_storage/shared_preference_util.dart';
import 'package:buzzwire/src/features/auth/domain/manager/local_user_manager.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_user_manager_impl.g.dart';

@riverpod
LocalUserManager localUserManager(LocalUserManagerRef ref) {
  return LocalUserManagerImpl(
      appPreference: ref.read(buzzWireSharedPrefProvider));
}

class LocalUserManagerImpl implements LocalUserManager {
  final BuzzWireSharedPref appPreference;

  LocalUserManagerImpl({required this.appPreference});

  @override
  Either<Failure, bool> readAppEntry() {
    try {
      final result = appPreference.getBool(appEntryKey) ?? false;
      return Right(result);
    } on Exception catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> saveAppEntry() async {
    try {
      final result = await appPreference.saveBool(appEntryKey, true);
      return Right(result);
    } on Exception catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
