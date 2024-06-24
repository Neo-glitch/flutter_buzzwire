import 'package:buzzwire/core/constants/colors.dart';
import 'package:flutter/material.dart';

class BuzzWireColorScheme {
  BuzzWireColorScheme._();

  static const lightTheme = ColorScheme(
    brightness: Brightness.light,
    primary: BuzzWireColors.primary,
    onPrimary: BuzzWireColors.white,
    secondary: BuzzWireColors.secondary,
    onSecondary: BuzzWireColors.black,
    tertiary: BuzzWireColors.tertiary,
    onTertiary: BuzzWireColors.black,
    error: BuzzWireColors.error,
    onError: BuzzWireColors.white,
    background: BuzzWireColors.light,
    onBackground: BuzzWireColors.black,
    surface: BuzzWireColors.light,
    onSurface: BuzzWireColors.black,
  );

  static const darkTheme = ColorScheme(
    brightness: Brightness.dark,
    primary: BuzzWireColors.primary,
    onPrimary: BuzzWireColors.white,
    secondary: BuzzWireColors.secondary,
    onSecondary: BuzzWireColors.black,
    tertiary: BuzzWireColors.tertiary,
    onTertiary: BuzzWireColors.black,
    error: BuzzWireColors.error,
    onError: BuzzWireColors.white,
    background: BuzzWireColors.dark,
    onBackground: BuzzWireColors.white,
    surface: BuzzWireColors.dark,
    onSurface: BuzzWireColors.white,
  );
}
