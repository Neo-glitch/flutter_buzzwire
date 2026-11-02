import 'dart:async';

import 'package:buzzwire/core/cache/constant/preference_keys.dart';
import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/cache/buzzwire_app_cache.dart';
import 'package:buzzwire/core/domain/manager/app_theme_manager.dart';
import 'package:flutter/src/material/app.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AppThemeManager)
class AppThemeManagerImpl implements AppThemeManager {
  final BuzzWireAppCache sharedPref;
  final _themeModeController = StreamController<ThemeMode>.broadcast();

  AppThemeManagerImpl({
    required this.sharedPref,
  });

  @override
  void dispose() {
    _themeModeController.close();
  }

  @override
  Stream<Either<Failure, ThemeMode>> getAppThemeModeStream() {
    getCachedThemeMode().then(_themeModeController.add);
    return _themeModeController.stream.map((themeMode) => Right(themeMode));
  }

  @override
  Future<Either<Failure, bool>> saveAppThemeMode(ThemeMode themeMode) async {
    try {
      final result =
          await sharedPref.saveString(themeModeKey, themeMode.toString());
      _themeModeController.add(themeMode);
      return Right(result);
    } on Exception catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Stream<ThemeMode> get themeModeStream => _themeModeController.stream;

  @override
  Future<Either<Failure, ThemeMode>> get currentThemeMode async {
    try {
      return Right(await getCachedThemeMode());
    } on Exception catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  Future<ThemeMode> getCachedThemeMode() async {
    ThemeMode currentThemeMode = ThemeMode.system;
    final themeModeString = await sharedPref.getString(themeModeKey);
    if (themeModeString != null) {
      currentThemeMode = ThemeMode.values.firstWhere(
        (element) => element.toString() == themeModeString,
        orElse: () => ThemeMode.system,
      );
    }
    return currentThemeMode;
  }
}
