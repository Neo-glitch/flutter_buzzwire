import 'package:buzzwire/core/cache/constant/preference_keys.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/domain/entity/error/failure.dart';
import '../../../../../core/cache/buzzwire_app_cache.dart';
import '../../domain/manager/local_user_manager.dart';

class LocalUserManagerImpl implements LocalUserManager {
  final BuzzWireAppCache appPreference;

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
