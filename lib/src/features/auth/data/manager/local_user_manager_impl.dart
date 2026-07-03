import 'package:buzzwire/core/cache/preference_keys.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/domain/error/failure.dart';
import '../../../../../core/cache/shared_preference_util.dart';
import '../../domain/manager/local_user_manager.dart';

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
