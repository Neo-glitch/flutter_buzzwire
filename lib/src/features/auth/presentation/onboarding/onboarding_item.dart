import 'package:buzzwire/core/constants/asset_strings.dart';
import 'package:buzzwire/core/constants/strings.dart';

class OnboardingItem {
  final String title;
  final String description;
  final String image;

  OnboardingItem(
      {required this.title, required this.description, required this.image});
}

List<OnboardingItem> items = [
  OnboardingItem(
      title: BuzzWireStrings.onBoardingTitle1,
      description: BuzzWireStrings.onBoardingSubTitle1,
      image: BuzzWireAssets.onBoardingLogo1),
  OnboardingItem(
      title: BuzzWireStrings.onBoardingTitle2,
      description: BuzzWireStrings.onBoardingSubTitle2,
      image: BuzzWireAssets.onBoardingLogo2),
  OnboardingItem(
      title: BuzzWireStrings.onBoardingTitle3,
      description: BuzzWireStrings.onBoardingSubTitle3,
      image: BuzzWireAssets.onBoardingLogo3),
  OnboardingItem(
      title: BuzzWireStrings.onBoardingTitle4,
      description: BuzzWireStrings.onBoardingSubTitle4,
      image: BuzzWireAssets.onBoardingLogo4),
];
