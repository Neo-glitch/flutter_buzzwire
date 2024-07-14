import 'package:buzzwire/core/constants/colors.dart';
import 'package:flutter/material.dart';

class BuzzWireChipTheme {
  BuzzWireChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: BuzzWireColors.darkGrey.withOpacity(0.4),
    labelStyle: const TextStyle().copyWith(color: BuzzWireColors.textBlack),
    selectedColor: BuzzWireColors.secondary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor:
        BuzzWireColors.white, // color of check mark icon if filter chip
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: BuzzWireColors.darkGrey.withOpacity(0.4),
    labelStyle: const TextStyle().copyWith(color: BuzzWireColors.textWhite),
    selectedColor: BuzzWireColors.secondary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor:
        BuzzWireColors.white, // color of check mark icon if filter chip
  );
}
