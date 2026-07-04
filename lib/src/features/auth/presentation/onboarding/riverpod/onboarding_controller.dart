import 'onboarding_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_controller.g.dart';

@riverpod
class OnBoardingController extends _$OnBoardingController {
  @override
  OnBoardingState build() {
    return const OnBoardingState();
  }

  void goToNextPage() {
    state = state.copyWith(pageIndex: state.pageIndex + 1);
  }

  void goToPreviousage() {
    state = state.copyWith(pageIndex: state.pageIndex - 1);
  }

  void updatePageIndex(int index) {
    state = state.copyWith(pageIndex: index);
  }
}
