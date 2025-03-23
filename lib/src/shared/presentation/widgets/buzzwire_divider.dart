import 'package:buzzwire/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuzzWireDivider extends StatelessWidget {
  const BuzzWireDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      color: BuzzWireColors.darkGrey,
      thickness: 0.2,
    );
  }
}
