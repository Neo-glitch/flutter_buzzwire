import 'package:buzzwire/core/constants/colors.dart';
import 'package:flutter/material.dart';

class BuzzWireAppBarTheme {
  BuzzWireAppBarTheme._();

  static final lightAppBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: BuzzWireColors.light,
      surfaceTintColor: Colors.transparent,
      iconTheme: const IconThemeData(color: BuzzWireColors.black, size: 24),
      actionsIconTheme:
          const IconThemeData(color: BuzzWireColors.black, size: 24),
      titleTextStyle: const TextStyle().copyWith(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: BuzzWireColors.black));

  static final darkAppBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: BuzzWireColors.dark,
      surfaceTintColor: Colors.transparent,
      iconTheme: const IconThemeData(color: BuzzWireColors.white, size: 24),
      actionsIconTheme:
          const IconThemeData(color: BuzzWireColors.white, size: 24),
      titleTextStyle: const TextStyle().copyWith(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: BuzzWireColors.textWhite));
}
