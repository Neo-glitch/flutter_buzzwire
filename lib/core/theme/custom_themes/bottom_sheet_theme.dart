import '../../constants/colors.dart';
import 'package:flutter/material.dart';

class BuzzWireBottomSheetTheme {
  BuzzWireBottomSheetTheme._();

  static const BottomSheetThemeData lightBottomSheetTheme =
      BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: BuzzWireColors.light,
    modalBackgroundColor: BuzzWireColors.light,
    modalBarrierColor: BuzzWireColors.translucentBlack,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    ),
  );

  static const BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: BuzzWireColors.dark,
    modalBackgroundColor: BuzzWireColors.dark,
    modalBarrierColor: BuzzWireColors.translucentBlack,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    ),
  );
}
