import 'package:buzzwire/core/constants/colors.dart';
import 'package:flutter/material.dart';

class BuzzWireDialogTheme {
  BuzzWireDialogTheme._();

  static final lightDialogTheme = const DialogTheme().copyWith(
    backgroundColor: BuzzWireColors.light,
    surfaceTintColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    ),
  );

  static final darkDialogTheme = const DialogTheme().copyWith(
    backgroundColor: BuzzWireColors.dark,
    surfaceTintColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    ),
  );
}
