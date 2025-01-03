import 'package:buzzwire/src/shared/presentation/riverpod/theme_controller.dart';
import 'package:buzzwire/src/shared/presentation/widgets/keyboard_dismiss_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constants/colors.dart';
import 'core/navigation/app_router.dart';
import 'core/theme/theme.dart';
import 'core/utils/device/device_utility.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(themeControllerProvider.notifier).initAppThemeStream());
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeControllerProvider);

    bool isDarkMode = _isDarkMode(themeMode, context);
    final statusbarColor =
        isDarkMode ? BuzzWireColors.dark : BuzzWireColors.light;

    BuzzWireDeviceUtils.setStatusBarColor(
      statusbarColor,
      isDarkMode: isDarkMode,
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: BuzzWireAppTheme.lightTheme,
      darkTheme: BuzzWireAppTheme.darkTheme,
      builder: (context, child) {
        return KeyboardDismissWrapper(
          child: child ?? const SizedBox.shrink(),
        );
      },
      // Uncomment to use splash screen
      // home: FlutterSplashScreen.fadeIn(
      //   backgroundColor: BuzzWireDeviceUtils.isDarkMode(context)
      //       ? BuzzWireColors.dark
      //       : BuzzWireColors.light,
      //   duration: const Duration(milliseconds: 2000),
      //   childWidget: SizedBox(
      //     height: 200,
      //     width: 200,
      //     child: Image.asset(BuzzWireAssets.splashLogo),
      //   ),
      //   nextScreen: const OnBoardingScreen(),
      // ),
      routerConfig: router,
    );
  }

  bool _isDarkMode(ThemeMode themeMode, BuildContext context) {
    return switch (themeMode) {
      ThemeMode.system => BuzzWireDeviceUtils.isDarkMode(context),
      ThemeMode.light => false,
      ThemeMode.dark => true
    };
  }
}
