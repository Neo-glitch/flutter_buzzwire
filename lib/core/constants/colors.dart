import 'package:flutter/material.dart';

/// Color resource for this project
///
class BuzzWireColors {
  BuzzWireColors._();

  // App Basic Colors
  static const Color primary = Color(0xFF0437F2);
  static const Color secondary = Color(0XFF00FFFF);
  static const Color tertiary = Color(0XFFFDBA74);

  // Text Colors
  static const Color textBlack = Color(0XFF121212);
  static const Color textSecondary = Color(0XFF6C7570);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color light = Color(0XFFF9F9F9);
  static const Color dark = Color(0XFF121212);
  static const Color primaryBackground = Color(0XFFF3F5FF);

  // Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = Colors.white.withOpacity(0.1);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF0437F2);
  static const Color buttonSecondary = Color(0XFF6C7570);
  static const Color buttonDisable = Color(0XFFC4C4C4);

  // Border Colors
  static const Color borderPrimary = Color(0XFFD9D9D9);
  static const Color borderSecondary = Color(0XFFE6E6E6);

  // Error and Validation COlors
  static const Color error = Color(0XFFD32F2F);
  static const Color success = Color(0XFF388E3C);
  static const Color warning = Color(0XFFF57C00);
  static const Color info = Color(0XFF00FFFF);

  // Neutral Colors (can be used for background)
  static const Color black = Color(0XFF000000);
  static const Color translucentBlack = Color(0x80000000);
  static const Color darkerGrey = Color(0XFF4F4F4F);
  static const Color darkGrey = Color(0XFF939393);
  static const Color grey = Color(0XFFE0E0E0);
  static const Color softGrey = Color(0XFFF4F4F4);
  static const Color lightGrey = Color(0XFFF9F9F9);
  static const Color white = Color(0XFFFFFFFF);

  // Gradient Colors
  static const Gradient linearGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Color(0xFF0437F2), Color(0XFF00FFFF), Color(0XFFFFFFFF)]);

  static const Gradient transparentToBlack = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Colors.black45,
      Colors.transparent,
    ],
  );
}
