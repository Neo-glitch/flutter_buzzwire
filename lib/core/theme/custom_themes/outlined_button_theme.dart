import '../../constants/colors.dart';
import 'package:flutter/material.dart';

class BuzzWireOutlinedButonTheme {
  BuzzWireOutlinedButonTheme._();

  static final lightTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      fixedSize: const Size.fromHeight(44),
      elevation: 0,
      foregroundColor: BuzzWireColors.primary,
      backgroundColor: Colors.transparent,
      disabledBackgroundColor: BuzzWireColors.darkGrey,
      disabledForegroundColor: BuzzWireColors.darkGrey,
      side: const BorderSide(color: BuzzWireColors.primary),
      padding: const EdgeInsets.symmetric(vertical: 10),
      textStyle: const TextStyle().copyWith(
          fontSize: 14,
          color: BuzzWireColors.textBlack,
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static final darkTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      fixedSize: const Size.fromHeight(44),
      elevation: 0,
      foregroundColor: BuzzWireColors.primary,
      backgroundColor: Colors.transparent,
      disabledBackgroundColor: BuzzWireColors.darkGrey,
      disabledForegroundColor: BuzzWireColors.darkGrey,
      side: const BorderSide(color: BuzzWireColors.primary),
      padding: const EdgeInsets.symmetric(vertical: 10),
      textStyle: const TextStyle().copyWith(
          fontSize: 14,
          color: BuzzWireColors.textWhite,
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
