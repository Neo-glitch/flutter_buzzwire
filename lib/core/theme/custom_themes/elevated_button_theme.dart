import '../../constants/colors.dart';
import 'package:flutter/material.dart';

// Todo: Should create a file for button styles so we can swap button styles easily without hassle
class BuzzWireElevatedButtonTheme {
  BuzzWireElevatedButtonTheme._();

  // Light Theme Button
  static final lightTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    minimumSize: const Size.fromHeight(48),
    elevation: 0,
    foregroundColor: BuzzWireColors.white,
    backgroundColor: BuzzWireColors.primary,
    disabledForegroundColor: BuzzWireColors.lightGrey,
    disabledBackgroundColor: BuzzWireColors.primary.withOpacity(0.4),
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
    minimumSize: const Size.fromHeight(48),
    elevation: 0,
    foregroundColor: BuzzWireColors.white,
    backgroundColor: BuzzWireColors.primary,
    disabledForegroundColor: BuzzWireColors.lightGrey,
    disabledBackgroundColor: BuzzWireColors.primary.withOpacity(0.4),
    side: const BorderSide(color: BuzzWireColors.primary),
    padding: const EdgeInsets.symmetric(vertical: 10),
    textStyle: const TextStyle().copyWith(
        fontSize: 16,
        color: BuzzWireColors.textWhite,
        fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ));
}
