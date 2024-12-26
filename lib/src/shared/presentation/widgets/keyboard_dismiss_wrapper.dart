import 'package:buzzwire/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

// wrapper class for all screens, to help hide keyboard once tap occurs outside
class KeyboardDismissWrapper extends StatelessWidget {
  final Widget child;

  const KeyboardDismissWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BuzzWireHelperFunctions.hideKeyboard();
      },
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}
