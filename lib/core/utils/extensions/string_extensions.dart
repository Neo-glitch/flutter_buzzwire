import 'package:flutter/material.dart';

extension UIThemeExtension on BuildContext {
  Color get background => Theme.of(this).colorScheme.background;
}
