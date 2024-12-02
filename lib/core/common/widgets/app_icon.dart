import '../../constants/asset_strings.dart';
import '../../constants/strings.dart';
import '../../utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BuzzWireAppIcon extends StatelessWidget {
  final MainAxisAlignment alignment;

  const BuzzWireAppIcon({super.key, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: alignment,
      children: [
        Image.asset(
          width: 13,
          height: 13,
          fit: BoxFit.fill,
          BuzzWireAssets.appLogo,
        ),
        const Gap(2),
        Text(
          BuzzWireStrings.appTitle,
          style: context.titleLarge?.copyWith(fontSize: 20),
        )
      ],
    );
  }
}
