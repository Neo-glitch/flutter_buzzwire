import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class BuzzWireInputFieldHeader extends StatelessWidget {
  final String title;
  final bool isRequired;
  const BuzzWireInputFieldHeader({
    super.key,
    required this.title,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: BuzzWireColors.darkGrey,
          ),
        ),
        if (isRequired)
          Text(
            "*",
            style: context.bodyMedium?.copyWith(
              color: Colors.red,
            ),
          )
      ],
    );
  }
}
