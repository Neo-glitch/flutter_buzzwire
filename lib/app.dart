import 'package:buzzwire/app_view.dart';
import 'package:buzzwire/core/constants/asset_strings.dart';
import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/theme/theme.dart';
import 'package:buzzwire/core/utils/device/device_utility.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: OnBoardingScreen(),
    );
  }
}
