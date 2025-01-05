import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/shared/domain/usecase/get_app_theme+mode_usecase.dart';
import 'package:buzzwire/src/shared/domain/usecase/get_app_theme_mode_stream_usecase.dart';
import 'package:buzzwire/src/shared/domain/usecase/save_app_theme_mode_usecase.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_controller.g.dart';

@Riverpod(keepAlive: true)
class ThemeController extends _$ThemeController {
  late GetAppThemeModeStream _getAppThemeStream;
  late SaveAppTheme _saveAppTheme;
  late GetAppThemeMode _getAppTheme;

  @override
  ThemeMode build() {
    _getAppThemeStream = injector();
    _saveAppTheme = injector();
    _getAppTheme = injector();
    final themeMode = getCurrentTheme();
    return themeMode;
  }

  void initAppThemeStream() {
    _getAppThemeStream(NoParams()).listen((event) {
      final themeMode = event.getOrElse((l) => ThemeMode.system);
      state = themeMode;
    });
  }

  ThemeMode getCurrentTheme() {
    return _getAppTheme(NoParams()).getOrElse((l) => ThemeMode.system);
  }

  Future<void> setAppTheme(ThemeMode themeMode) async {
    await _saveAppTheme(themeMode);
  }
}
