import 'package:buzzwire/core/res/colors.dart';
import 'package:flutter/material.dart';

// Todo: Should create a file for button styles so we can swap button styles easily without hassle
class BuzzWireElevatedButtonTheme {
  BuzzWireElevatedButtonTheme._();

  // Light Theme Button
  static final lightTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: BuzzWireColors.white,
    backgroundColor: BuzzWireColors.primary,
    disabledForegroundColor: BuzzWireColors.grey,
    disabledBackgroundColor: BuzzWireColors.grey,
    side: const BorderSide(color: BuzzWireColors.primary),
    padding: const EdgeInsets.symmetric(vertical: 10),
    textStyle: const TextStyle().copyWith(
        fontSize: 16,
        color: BuzzWireColors.textWhite,
        fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ));

  // dark Theme:
  static final darkTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: BuzzWireColors.white,
    backgroundColor: BuzzWireColors.primary,
    disabledForegroundColor: BuzzWireColors.grey,
    disabledBackgroundColor: BuzzWireColors.grey,
    side: const BorderSide(color: BuzzWireColors.primary),
    padding: const EdgeInsets.symmetric(vertical: 10),
    textStyle: const TextStyle().copyWith(
        fontSize: 16,
        color: BuzzWireColors.textWhite,
        fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ));
}
