import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class BuzzWireColorScheme {
  BuzzWireColorScheme._();

  static final lightTheme = ColorScheme(
    brightness: Brightness.light,
    primary: BuzzWireColors.primary,
    onPrimary: BuzzWireColors.white,
    secondary: BuzzWireColors.secondary,
    onSecondary: BuzzWireColors.dark,
    tertiary: BuzzWireColors.tertiary,
    onTertiary: BuzzWireColors.dark,
    error: BuzzWireColors.error,
    onError: BuzzWireColors.white,
    background: BuzzWireColors.light,
    onBackground: BuzzWireColors.dark,
    surface: BuzzWireColors.light,
    onSurface: BuzzWireColors.dark,
    surfaceTint: Colors.transparent,
    scrim: BuzzWireColors.black.withOpacity(0.32),
  );

  static final darkTheme = ColorScheme(
    brightness: Brightness.dark,
    primary: BuzzWireColors.primary,
    onPrimary: BuzzWireColors.white,
    secondary: BuzzWireColors.secondary,
    onSecondary: BuzzWireColors.dark,
    tertiary: BuzzWireColors.tertiary,
    onTertiary: BuzzWireColors.dark,
    error: BuzzWireColors.error,
    onError: BuzzWireColors.white,
    background: BuzzWireColors.dark,
    onBackground: BuzzWireColors.white,
    surface: BuzzWireColors.dark,
    onSurface: BuzzWireColors.white,
    surfaceTint: Colors.transparent,
    scrim: BuzzWireColors.black.withOpacity(0.32),
  );
}
