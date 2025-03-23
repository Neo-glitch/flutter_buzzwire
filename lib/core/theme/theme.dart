import 'package:buzzwire/core/theme/custom_themes/dialog_theme.dart';

import '../constants/colors.dart';
import '../constants/strings.dart';
import 'color_schemes/color_schemes.dart';
import 'custom_themes/app_bar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class BuzzWireAppTheme {
  BuzzWireAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: BuzzWireColorScheme.lightTheme,
    fontFamily: BuzzWireStrings.poppins,
    brightness: Brightness.light,
    primaryColor: BuzzWireColors.primary,
    scaffoldBackgroundColor: BuzzWireColors.light,
    textTheme: BuzzWireTextTheme.lightTextTheme,
    appBarTheme: BuzzWireAppBarTheme.lightAppBarTheme,
    chipTheme: BuzzWireChipTheme.lightChipTheme,
    checkboxTheme: BuzzWireCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: BuzzWireBottomSheetTheme.lightBottomSheetTheme,
    inputDecorationTheme: BuzzWireTextFieldTheme.lightInputDecorationTheme,
    elevatedButtonTheme: BuzzWireElevatedButtonTheme.lightTheme,
    outlinedButtonTheme: BuzzWireOutlinedButonTheme.lightTheme,
    dialogTheme: BuzzWireDialogTheme.lightDialogTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: BuzzWireColorScheme.darkTheme,
    fontFamily: BuzzWireStrings.poppins,
    brightness: Brightness.dark,
    primaryColor: BuzzWireColors.primary,
    scaffoldBackgroundColor: BuzzWireColors.dark,
    textTheme: BuzzWireTextTheme.darkTextTheme,
    appBarTheme: BuzzWireAppBarTheme.darkAppBarTheme,
    chipTheme: BuzzWireChipTheme.darkChipTheme,
    checkboxTheme: BuzzWireCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: BuzzWireBottomSheetTheme.darkBottomSheetTheme,
    inputDecorationTheme: BuzzWireTextFieldTheme.darkInputDecorationTheme,
    elevatedButtonTheme: BuzzWireElevatedButtonTheme.darkTheme,
    outlinedButtonTheme: BuzzWireOutlinedButonTheme.darkTheme,
    dialogTheme: BuzzWireDialogTheme.darkDialogTheme,
  );
}
