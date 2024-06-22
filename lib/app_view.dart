import 'package:buzzwire/core/theme/theme.dart';
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
      home: Scaffold(),
    );
  }
}
