import 'package:buzzwire/core/error/failure.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

abstract class AppThemeManager {
  Stream<ThemeMode> get themeModeStream;
  Either<Failure, ThemeMode> get currentThemeMode;
  Stream<Either<Failure, ThemeMode>> getAppThemeModeStream();
  Future<Either<Failure, bool>> saveAppThemeMode(ThemeMode themeMode);
  void dispose();
}
