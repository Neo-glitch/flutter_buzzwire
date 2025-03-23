import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FormInputGroup extends StatelessWidget {
  final Widget child;
  final String headerTitle;
  final bool isRequiredInput;

  const FormInputGroup({
    super.key,
    required this.headerTitle,
    this.isRequiredInput = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputHeader(context),
        const Gap(10),
        child,
      ],
    );
  }

  Widget _buildInputHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerTitle,
          style: context.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: BuzzWireColors.darkGrey,
          ),
        ),
        if (isRequiredInput)
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
