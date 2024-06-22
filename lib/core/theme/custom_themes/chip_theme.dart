import 'package:buzzwire/core/res/colors.dart';
import 'package:flutter/material.dart';

class BuzzWireChipTheme {
  BuzzWireChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: BuzzWireColors.darkGrey.withOpacity(0.4),
    labelStyle: const TextStyle().copyWith(color: BuzzWireColors.black),
    selectedColor: BuzzWireColors.secondary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor:
        BuzzWireColors.white, // color of check mark icon if filter chip
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: BuzzWireColors.darkGrey.withOpacity(0.4),
    labelStyle: const TextStyle().copyWith(color: BuzzWireColors.white),
    selectedColor: BuzzWireColors.secondary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor:
        BuzzWireColors.white, // color of check mark icon if filter chip
  );
}
