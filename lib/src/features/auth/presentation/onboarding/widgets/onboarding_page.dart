import 'package:buzzwire/core/utils/device/device_utility.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/auth/presentation/onboarding/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class OnBoardingPage extends StatelessWidget {
  final OnboardingItem onboardingItem;

  const OnBoardingPage({super.key, required this.onboardingItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: SvgPicture.asset(
            onboardingItem.image,
            semanticsLabel: "OnBoarding Image",
            fit: BoxFit.cover,
            height: BuzzWireDeviceUtils.getScreenHeight(context) / 1.8,
          ),
        ),
        const Gap(10),
        Text(
          textAlign: TextAlign.center,
          onboardingItem.title,
          style: context.headlineLarge!.copyWith(fontWeight: FontWeight.w700),
        ),
        const Gap(20),
        Text(
          textAlign: TextAlign.center,
          onboardingItem.description,
          style: context.bodyMedium,
        ),
      ],
    );
  }
}
