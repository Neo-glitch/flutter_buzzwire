import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  // Text Styles
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;
  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get titleTextStyle => Theme.of(this).appBarTheme.titleTextStyle;

  // Colors
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get onPrimaryColor => Theme.of(this).colorScheme.onPrimary;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get onSecondaryColor => Theme.of(this).colorScheme.onSecondary;
  Color get tertiaryColor => Theme.of(this).colorScheme.tertiary;
  Color get onTeriaryColor => Theme.of(this).colorScheme.onTertiary;
  Color get errorColor => Theme.of(this).colorScheme.error;
  Color get onErrorColor => Theme.of(this).colorScheme.onError;
  Color get backgroundColor => Theme.of(this).colorScheme.background;
  Color get onBackgroundColor => Theme.of(this).colorScheme.onBackground;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get onSurfaceColor => Theme.of(this).colorScheme.onSurface;

  // can other functions like showing a toast and all
}
