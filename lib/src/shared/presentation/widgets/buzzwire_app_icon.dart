import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/asset_strings.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/utils/extensions/context_extension.dart';

class BuzzWireAppIcon extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final double fontSize;

  const BuzzWireAppIcon({
    super.key,
    required this.mainAxisAlignment,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment,
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
          style: context.titleLarge
              ?.copyWith(fontSize: fontSize, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
