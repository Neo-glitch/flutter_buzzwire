import '../../../../../../core/utils/device/device_utility.dart';
import '../../../../../../core/utils/extensions/context_extension.dart';
import '../onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class OnBoardingPage extends StatefulWidget {
  final OnboardingItem onboardingItem;

  const OnBoardingPage({super.key, required this.onboardingItem});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with TickerProviderStateMixin {
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
      lowerBound: 0,
      upperBound: 1,
    );

    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animController,
      child: _buildContent(context),
      builder: (ctx, child) {
        return FadeTransition(
          opacity: _animController,
          child: child,
        );
      },
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            widget.onboardingItem.image,
            semanticsLabel: "OnBoarding Image",
            fit: BoxFit.contain,
            height: BuzzWireDeviceUtils.getScreenHeight(context) / 2,
          ),
          const Gap(10),
          Text(
            textAlign: TextAlign.center,
            widget.onboardingItem.title,
            style: context.headlineLarge!.copyWith(fontWeight: FontWeight.w700),
          ),
          const Gap(20),
          Text(
            textAlign: TextAlign.center,
            widget.onboardingItem.description,
            style: context.bodyMedium,
          ),
        ],
      ),
    );
  }
}
