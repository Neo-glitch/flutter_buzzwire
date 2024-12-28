import '../../constants/colors.dart';
import 'package:flutter/material.dart';

class BuzzWireBottomSheetTheme {
  BuzzWireBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: BuzzWireColors.light,
    modalBackgroundColor: BuzzWireColors.light,
    modalBarrierColor: BuzzWireColors.black.withOpacity(0.15),
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16))),
  );

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: BuzzWireColors.dark,
    modalBackgroundColor: BuzzWireColors.dark,
    modalBarrierColor: BuzzWireColors.black.withOpacity(0.15),
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16))),
  );
}
