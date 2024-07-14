import '../../../../../../core/constants/asset_strings.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/strings.dart';
import '../../../../../../core/utils/device/device_utility.dart';
import '../../../../../../core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          width: BuzzWireDeviceUtils.getScreenWidth(context),
          height: BuzzWireDeviceUtils.getScreenHeight(context) * 0.35,
          BuzzWireAssets.signInHeaderBg,
          fit: BoxFit.cover,
        ),
        Container(
          width: BuzzWireDeviceUtils.getScreenWidth(context),
          height: BuzzWireDeviceUtils.getScreenHeight(context) * 0.35,
          decoration: const BoxDecoration(
            gradient: BuzzWireColors.transparentToBlack,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 0,
          left: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
                style:
                    context.titleLarge!.copyWith(color: BuzzWireColors.white),
              )
            ],
          ),
        )
      ],
    );
  }
}
