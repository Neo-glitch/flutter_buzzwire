import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/shared/domain/manager/app_theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/src/either.dart';

class SaveAppTheme implements UseCaseFutureVoid<ThemeMode> {
  final AppThemeManager themeManager;

  SaveAppTheme({required this.themeManager});
  @override
  Future<Either<Failure, bool>> call(ThemeMode param) {
    return themeManager.saveAppThemeMode(param);
  }
}
