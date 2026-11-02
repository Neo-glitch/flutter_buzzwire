import 'package:buzzwire/core/theme/app_colors.dart';
import 'package:buzzwire/src/features/notification/data/services/buzzwire_messaging_service.dart';
import 'package:buzzwire/theme_controller.dart';
import 'package:buzzwire/core/ui/widgets/layout/keyboard_dismiss_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/navigation/router/app_router.dart';
import 'core/theme/theme.dart';
import 'core/common/utils/device_util.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(themeControllerProvider.notifier).initAppThemeStream();
      BuzzWireMessagingService.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    final themeMode =
        ref.watch(themeControllerProvider).valueOrNull ?? ThemeMode.system;

    bool isDarkMode = _isDarkMode(themeMode, context);
    final statusbarColor =
        isDarkMode ? BuzzWireColors.dark : BuzzWireColors.light;

    BuzzWireDeviceUtils.setStatusBarColor(
      statusbarColor,
      isDarkMode,
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
