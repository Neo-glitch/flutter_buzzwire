import '../../../injector.dart';
import '../../domain/manager/app_theme_manager.dart';
import '../manager/app_theme_manager_impl.dart';

Future<void> provideDataDependencies() async {
  injector.registerLazySingleton<AppThemeManager>(
          () => AppThemeManagerImpl(sharedPref: injector()));
}