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
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  pageSnapping: true,
                  controller: _pageController,
                  physics: const ClampingScrollPhysics(),
                  itemCount: _onboardingItems.length,
                  onPageChanged: (value) {
                    ref
                        .read(onBoardingControllerProvider.notifier)
                        .updatePageIndex(value);
                  },
                  itemBuilder: (ctx, idx) {
                    final item = _onboardingItems[idx];
                    return OnBoardingPage(onboardingItem: item);
                  },
                ),
              ),
              const Gap(12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: uiState.pageIndex < 3,
                      child: Material(
                        child: InkWell(
                          child: Text(
                            "Skip",
                            style: context.bodyMedium,
                          ),
                          onTap: () {
                            _pageController
                                .jumpToPage(_onboardingItems.length - 1);
                          },
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
                      onPressed: () {
                        if (uiState.pageIndex < 3) {
                          _navigateToOnBoardingPage(uiState.pageIndex + 1);
                        } else {
                          ref
                              .read(appEntryControllerProvider.notifier)
                              .saveAppEntry();
                        }
                      },
                      icon: const Icon(Icons.navigate_next_rounded),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
