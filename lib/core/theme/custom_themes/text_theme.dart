import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/constants/strings.dart';
import 'package:flutter/material.dart';

class BuzzWireTextTheme {
  BuzzWireTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: const TextStyle().copyWith(
        fontFamily: BuzzWireStrings.playFairDisplay,
        fontSize: 57.0,
        fontWeight: FontWeight.w400,
        color: BuzzWireColors.textBlack),
    displayMedium: const TextStyle().copyWith(
        fontFamily: BuzzWireStrings.playFairDisplay,
        fontSize: 45.0,
        fontWeight: FontWeight.w500,
        color: BuzzWireColors.textBlack),
    displaySmall: const TextStyle().copyWith(
        fontFamily: BuzzWireStrings.playFairDisplay,
        fontSize: 36.0,
        fontWeight: FontWeight.w400,
        color: BuzzWireColors.textBlack),
    headlineLarge: const TextStyle().copyWith(
        fontFamily: BuzzWireStrings.merriWeather,
        fontSize: 32.0,
        fontWeight: FontWeight.w400,
        color: BuzzWireColors.textBlack),
    headlineMedium: const TextStyle().copyWith(
        fontFamily: BuzzWireStrings.merriWeather,
        fontSize: 28.0,
        fontWeight: FontWeight.w400,
        color: BuzzWireColors.textBlack),
    headlineSmall: const TextStyle().copyWith(
        fontFamily: BuzzWireStrings.merriWeather,
        fontSize: 24.0,
        fontWeight: FontWeight.w400,
        color: BuzzWireColors.textBlack),
    titleLarge: const TextStyle().copyWith(
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: BuzzWireColors.textBlack),
    titleMedium: const TextStyle().copyWith(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: BuzzWireColors.textBlack),
    titleSmall: const TextStyle().copyWith(
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: BuzzWireColors.textBlack),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: BuzzWireColors.textBlack),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: BuzzWireColors.textBlack),
    bodySmall: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: BuzzWireColors.textBlack.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: BuzzWireColors.textBlack),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: BuzzWireColors.textBlack.withOpacity(0.5)),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: const TextStyle().copyWith(
        fontFamily: BuzzWireStrings.playFairDisplay,
        fontSize: 57.0,
        fontWeight: FontWeight.w400,
        color: BuzzWireColors.textWhite),
    displayMedium: const TextStyle().copyWith(
        fontFamily: BuzzWireStrings.playFairDisplay,
        fontSize: 45.0,
        fontWeight: FontWeight.w500,
        color: BuzzWireColors.textWhite),
    displaySmall: const TextStyle().copyWith(
        fontFamily: BuzzWireStrings.playFairDisplay,
        fontSize: 36.0,
        fontWeight: FontWeight.w400,
        color: BuzzWireColors.textWhite),
    headlineLarge: const TextStyle().copyWith(
        fontFamily: BuzzWireStrings.merriWeather,
        fontSize: 32.0,
        fontWeight: FontWeight.w400,
        color: BuzzWireColors.textWhite),
    headlineMedium: const TextStyle().copyWith(
        fontFamily: BuzzWireStrings.merriWeather,
        fontSize: 28.0,
        fontWeight: FontWeight.w400,
        color: BuzzWireColors.textWhite),
    headlineSmall: const TextStyle().copyWith(
        fontFamily: BuzzWireStrings.merriWeather,
        fontSize: 24.0,
        fontWeight: FontWeight.w400,
        color: BuzzWireColors.textWhite),
    titleLarge: const TextStyle().copyWith(
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: BuzzWireColors.textWhite),
    titleMedium: const TextStyle().copyWith(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: BuzzWireColors.textWhite),
    titleSmall: const TextStyle().copyWith(
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: BuzzWireColors.textWhite),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: BuzzWireColors.textWhite),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: BuzzWireColors.textWhite),
    bodySmall: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: BuzzWireColors.textWhite.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: BuzzWireColors.textWhite),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: BuzzWireColors.textWhite.withOpacity(0.5)),
  );
}
