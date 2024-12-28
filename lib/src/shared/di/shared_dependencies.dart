import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/shared/domain/usecase/get_app_theme+mode_usecase.dart';
import 'package:buzzwire/src/shared/domain/usecase/get_app_theme_mode_stream_usecase.dart';
import 'package:buzzwire/src/shared/domain/usecase/save_app_theme_mode_usecase.dart';

Future<void> provideSharedDependencies() async {
  injector.registerFactory<GetAppThemeModeStream>(
      () => GetAppThemeModeStream(themeManager: injector()));
  injector.registerFactory<GetAppThemeMode>(
      () => GetAppThemeMode(themeManager: injector()));
  injector.registerFactory<SaveAppTheme>(
      () => SaveAppTheme(themeManager: injector()));
}
