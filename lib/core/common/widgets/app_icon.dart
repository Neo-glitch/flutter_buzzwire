import 'package:buzzwire/core/constants/asset_strings.dart';
import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
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
          width: 15,
          height: 15,
          fit: BoxFit.fill,
          BuzzWireAssets.appLogo,
        ),
        const Gap(5),
        Text(
          BuzzWireStrings.appTitle,
          style: context.titleLarge,
        )
      ],
    );
  }
}
