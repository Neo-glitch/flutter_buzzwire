import 'dart:async';

import 'package:buzzwire/core/constants/preference_keys.dart';
import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/utils/local_storage/shared_preference_util.dart';
import 'package:buzzwire/src/shared/domain/manager/app_theme_manager.dart';
import 'package:flutter/src/material/app.dart';
import 'package:fpdart/fpdart.dart';

class AppThemeManagerImpl implements AppThemeManager {
  final BuzzWireSharedPref sharedPref;
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
    _themeModeController.add(getCachedThemeMode());
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
  Either<Failure, ThemeMode> get currentThemeMode =>
      Right(getCachedThemeMode());

  ThemeMode getCachedThemeMode() {
    ThemeMode currentThemeMode = ThemeMode.system;
    final themeModeString = sharedPref.getString(themeModeKey);
    if (themeModeString != null) {
      currentThemeMode = ThemeMode.values.firstWhere(
        (element) => element.toString() == themeModeString,
        orElse: () => ThemeMode.system,
      );
    }
    return currentThemeMode;
  }
}
