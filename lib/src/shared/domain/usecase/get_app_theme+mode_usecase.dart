import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/shared/domain/manager/app_theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/src/either.dart';

class GetAppThemeMode implements UseCaseResult<ThemeMode, NoParams> {
  final AppThemeManager themeManager;

  GetAppThemeMode({required this.themeManager});
  @override
  Either<Failure, ThemeMode> call(NoParams param) {
    return themeManager.currentThemeMode;
  }
}
