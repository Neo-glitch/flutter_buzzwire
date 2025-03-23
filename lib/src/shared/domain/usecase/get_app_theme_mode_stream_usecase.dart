import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/shared/domain/manager/app_theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/src/either.dart';

class GetAppThemeModeStream implements UseCaseStream<ThemeMode, NoParams> {
  final AppThemeManager themeManager;

  GetAppThemeModeStream({required this.themeManager});
  @override
  Stream<Either<Failure, ThemeMode>> call(NoParams param) {
    return themeManager.getAppThemeModeStream();
  }
}
