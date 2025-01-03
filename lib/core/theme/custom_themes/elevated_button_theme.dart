import '../../constants/colors.dart';
import 'package:flutter/material.dart';

// Todo: Should create a file for button styles so we can swap button styles easily without hassle
class BuzzWireElevatedButtonTheme {
  BuzzWireElevatedButtonTheme._();

  // Light Theme Button
  static final lightTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    fixedSize: const Size.fromHeight(44),
    elevation: 0,
    foregroundColor: BuzzWireColors.white,
    backgroundColor: BuzzWireColors.primary,
    disabledForegroundColor: BuzzWireColors.lightGrey,
    disabledBackgroundColor: BuzzWireColors.primary.withOpacity(0.4),
    padding: const EdgeInsets.symmetric(vertical: 10),
    textStyle: const TextStyle().copyWith(
        fontSize: 14,
        color: BuzzWireColors.textWhite,
        fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ));

  // dark Theme:
  static final darkTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    fixedSize: const Size.fromHeight(44),
    elevation: 0,
    foregroundColor: BuzzWireColors.white,
    backgroundColor: BuzzWireColors.primary,
    disabledForegroundColor: BuzzWireColors.lightGrey,
    disabledBackgroundColor: BuzzWireColors.primary.withOpacity(0.4),
    padding: const EdgeInsets.symmetric(vertical: 10),
    textStyle: const TextStyle().copyWith(
        fontSize: 14,
        color: BuzzWireColors.textWhite,
        fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ));
}
