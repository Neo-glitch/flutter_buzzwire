import 'package:buzzwire/core/navigation/route.dart';
import 'package:buzzwire/src/features/auth/presentation/onboarding/riverpod/onboarding_state.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/device/device_utility.dart';
import '../../../../../../core/utils/extensions/context_extension.dart';
import '../../app_entry/app_entry_controller.dart';
import '../onboarding_item.dart';
import '../riverpod/onboarding_controller.dart';
import '../widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends ConsumerStatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnBoardingScreenState();
}

class _OnBoardingScreenState extends ConsumerState<OnBoardingScreen> {
  late PageController _pageController;
  late List<OnboardingItem> _onboardingItems;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _onboardingItems = items;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToOnBoardingPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeIn,
    );
  }

  void _onSkipPress() {
    _pageController.jumpToPage(_onboardingItems.length - 1);
  }

  void _onNextButtonPres(int currentPageIndex) {
    if (currentPageIndex < items.length - 1) {
      _navigateToOnBoardingPage(currentPageIndex + 1);
    } else {
      ref.read(appEntryControllerProvider.notifier).saveAppEntry();
    }
  }

  @override
  Widget build(BuildContext context) {
    var uiState = ref.watch(onBoardingControllerProvider);
    BuzzWireDeviceUtils.setFullScreen(false);

    return SafeArea(
      child: Container(
        color: context.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                // viewpager in flutter
                child: _buildPageView(),
              ),
              const Gap(12),
              _buildBottomNavigationRow(uiState, context)
            ],
          ),
        ),
      ),
    );
  }

  PageView _buildPageView() {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      controller: _pageController,
      physics: const ClampingScrollPhysics(),
      itemCount: _onboardingItems.length,
      onPageChanged: (value) {
        ref.read(onBoardingControllerProvider.notifier).updatePageIndex(value);
      },
      itemBuilder: (ctx, idx) {
        final item = _onboardingItems[idx];
        return OnBoardingPage(onboardingItem: item);
      },
    );
  }

  Widget _buildBottomNavigationRow(
    OnBoardingState uiState,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: uiState.pageIndex < 3,
            child: Material(
              child: InkWell(
                onTap: _onSkipPress,
                child: Text(
                  "Skip",
                  style: context.bodyMedium,
                ),
              ),
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: _onboardingItems.length,
            onDotClicked: (index) {
              _navigateToOnBoardingPage(index);
            },
            effect: ExpandingDotsEffect(
              dotHeight: 6,
              dotWidth: 6,
              activeDotColor: context.primaryColor,
            ),
          ),
          IconButton.filled(
            iconSize: 30,
            onPressed: () => _onNextButtonPres(uiState.pageIndex),
            icon: const Icon(Icons.navigate_next_rounded),
          ),
        ],
      ),
    );
  }
}
