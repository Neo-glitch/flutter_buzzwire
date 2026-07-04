import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension NavigationExtension on BuildContext {
  void popUntilPath(String routePath) {
    final router = GoRouter.of(this);
    final currentLocation =
        router.routerDelegate.currentConfiguration.matches.last.matchedLocation;

    while (currentLocation != routePath && canPop()) {
      pop();
    }
  }

  // Replace with GoRouter call: context.pushNamed(routeName)
  // void navigateToScreen(BuildContext context, Widget screen) {
  //   Navigator.push(this, MaterialPageRoute(builder: (_) => screen));
  // }
}
