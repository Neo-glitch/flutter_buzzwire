import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BuzzWireSimpleDialog extends StatelessWidget {
  final String title;
  final String description;
  final String? primaryButtonText;
  final String? secondaryButtonText;
  final void Function()? onPrimaryClick;
  final void Function()? onSecondaryClick;

  const BuzzWireSimpleDialog({
    super.key,
    required this.title,
    required this.description,
    this.primaryButtonText,
    this.secondaryButtonText,
    this.onPrimaryClick,
    this.onSecondaryClick,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.only(top: 15, bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ..._buildInfoSection(context),
            Divider(
              height: 2,
              color: BuzzWireColors.grey.withOpacity(0.6),
              thickness: 1,
            ),
            const Gap(10),
            _buildButtonSection(context)
          ],
        ),
      ),
    );
  }

  List<Widget> _buildInfoSection(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      const Gap(10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          description,
          textAlign: TextAlign.center,
        ),
      ),
      const Gap(30),
    ];
  }

  Widget _buildButtonSection(BuildContext context) {
    final primaryButtonTetColor = secondaryButtonText != null
        ? BuzzWireColors.darkGrey
        : context.primaryColor;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (onPrimaryClick != null) {
                  onPrimaryClick!();
                }
              },
              child: Text(
                textAlign: TextAlign.center,
                primaryButtonText ?? "Close",
                style:
                    context.labelLarge?.copyWith(color: primaryButtonTetColor),
              ),
            ),
          ),
          if (secondaryButtonText != null)
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (onSecondaryClick != null) {
                    onSecondaryClick!();
                  }
                },
                child: Text(
                  textAlign: TextAlign.center,
                  secondaryButtonText!,
                  style: context.labelLarge?.copyWith(fontSize: 14),
                ),
              ),
            )
        ],
      ),
    );
  }
}
