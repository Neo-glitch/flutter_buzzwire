import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/core/domain/usecase/get_app_theme_mode_usecase.dart';
import 'package:buzzwire/core/domain/usecase/get_app_theme_mode_stream_usecase.dart';
import 'package:buzzwire/core/domain/usecase/save_app_theme_mode_usecase.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_controller.g.dart';

@Riverpod(keepAlive: true)
class ThemeController extends _$ThemeController {
  late GetAppThemeModeStream _getAppThemeStream;
  late SaveAppTheme _saveAppTheme;
  late GetAppThemeMode _getAppTheme;

  @override
  Future<ThemeMode> build() async {
    _getAppThemeStream = injector();
    _saveAppTheme = injector();
    _getAppTheme = injector();
    final result = await _getAppTheme(NoParams());
    return result.getOrElse((l) => ThemeMode.system);
  }

  void initAppThemeStream() {
    _getAppThemeStream(NoParams()).listen((event) {
      final themeMode = event.getOrElse((l) => ThemeMode.system);
      state = AsyncData(themeMode);
    });
  }

  ThemeMode getCurrentTheme() {
    return state.valueOrNull ?? ThemeMode.system;
  }

  Future<void> setAppTheme(ThemeMode themeMode) async {
    await _saveAppTheme(themeMode);
  }
}
