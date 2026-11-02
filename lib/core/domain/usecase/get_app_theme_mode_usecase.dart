import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/core/domain/manager/app_theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAppThemeMode implements UseCaseFuture<ThemeMode, NoParams> {
  final AppThemeManager themeManager;

  GetAppThemeMode({required this.themeManager});
  @override
  Future<Either<Failure, ThemeMode>> call(NoParams param) {
    return themeManager.currentThemeMode;
  }
}
