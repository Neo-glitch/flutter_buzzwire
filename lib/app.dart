import 'app_view.dart';
import 'core/constants/asset_strings.dart';
import 'core/constants/colors.dart';
import 'core/navigation/app_router.dart';
import 'core/theme/theme.dart';
import 'core/utils/device/device_utility.dart';
import 'core/utils/extensions/context_extension.dart';
import 'core/utils/logging/logger_helper.dart';
import 'src/features/auth/presentation/onboarding/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    bool isDarkMode = BuzzWireDeviceUtils.isDarkMode(context);
    final statusbarColor =
        isDarkMode ? BuzzWireColors.black : BuzzWireColors.white;
    BuzzWireDeviceUtils.setStatusBarColor(
      statusbarColor,
      isDarkMode: isDarkMode,
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: BuzzWireAppTheme.lightTheme,
      darkTheme: BuzzWireAppTheme.darkTheme,
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
}
