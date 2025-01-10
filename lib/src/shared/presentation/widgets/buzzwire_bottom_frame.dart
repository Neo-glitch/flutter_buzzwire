import 'package:buzzwire/core/constants/colors.dart';
import 'package:flutter/material.dart';

class BuzzWireBottomFrame extends StatelessWidget {
  final Widget? child;
  const BuzzWireBottomFrame({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: BuzzWireColors.black.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: child,
    );
  }
}
