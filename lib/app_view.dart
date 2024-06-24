import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:buzzwire/core/constants/asset_strings.dart';
import 'package:buzzwire/core/theme/theme.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

/// First view on the app
class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: BuzzWireAppTheme.lightTheme,
      darkTheme: BuzzWireAppTheme.darkTheme,
      home: FlutterSplashScreen.fadeIn(
        backgroundColor: context.backgroundColor,
        duration: const Duration(milliseconds: 2),
        childWidget: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset(BuzzWireAssets.splashLogo),
        ),
        nextScreen: const OnboardingScreen(),
      ),
    );
  }
}
