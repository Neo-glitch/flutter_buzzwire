import '../../constants/colors.dart';
import 'package:flutter/material.dart';

class BuzzWireTextFieldTheme {
  BuzzWireTextFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    errorMaxLines: 3,
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    // prefixIconColor: MaterialStateColor.resolveWith((states) {
    //   if (states.contains(MaterialState.focused)) {
    //     return BuzzWireColors.primary;
    //   }
    //   if (states.contains(MaterialState.error)) {
    //     return BuzzWireColors.error;
    //   }
    //   return BuzzWireColors.darkGrey;
    // }),
    // suffixIconColor: MaterialStateColor.resolveWith((states) {
    //   if (states.contains(MaterialState.focused)) {
    //     return BuzzWireColors.primary;
    //   }
    //   if (states.contains(MaterialState.error)) {
    //     return BuzzWireColors.error;
    //   }
    //   return BuzzWireColors.darkGrey;
    // }),
    prefixIconColor: BuzzWireColors.darkGrey,
    suffixIconColor: BuzzWireColors.darkGrey,
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
    hintStyle: const TextStyle()
        .copyWith(fontSize: 14, color: Colors.black.withOpacity(0.35)),
    errorStyle:
        const TextStyle().copyWith(fontSize: 14, color: BuzzWireColors.error),
    floatingLabelStyle:
        const TextStyle().copyWith(color: BuzzWireColors.primary),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: BuzzWireColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: BuzzWireColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: BuzzWireColors.primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: BuzzWireColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: BuzzWireColors.error),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    fillColor: Colors.black,
    filled: true,
    errorMaxLines: 3,
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    // prefixIconColor: MaterialStateColor.resolveWith((states) {
    //   if (states.contains(MaterialState.focused)) {
    //     return BuzzWireColors.primary;
    //   }
    //   if (states.contains(MaterialState.error)) {
    //     return BuzzWireColors.error;
    //   }
    //   return BuzzWireColors.darkGrey;
    // }),
    // suffixIconColor: MaterialStateColor.resolveWith((states) {
    //   if (states.contains(MaterialState.focused)) {
    //     return BuzzWireColors.primary;
    //   }
    //   if (states.contains(MaterialState.error)) {
    //     return BuzzWireColors.error;
    //   }
    //   return BuzzWireColors.darkGrey;
    // }),
    prefixIconColor: BuzzWireColors.darkGrey,
    suffixIconColor: BuzzWireColors.darkGrey,
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
    hintStyle: const TextStyle()
        .copyWith(fontSize: 14, color: Colors.white.withOpacity(0.35)),
    errorStyle:
        const TextStyle().copyWith(fontSize: 14, color: BuzzWireColors.error),
    floatingLabelStyle:
        const TextStyle().copyWith(color: BuzzWireColors.primary),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: BuzzWireColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: BuzzWireColors.white),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: BuzzWireColors.primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: BuzzWireColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: BuzzWireColors.error),
    ),
  );
}
