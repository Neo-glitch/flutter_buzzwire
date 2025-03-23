import 'package:fpdart/fpdart.dart';

import '../../../../../core/constants/preference_keys.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/local_storage/shared_preference_util.dart';
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
