import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransitionFactory {
  TransitionFactory._();

  static CustomTransitionPage _getSlideTransitionPage({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeIn)),
        ),
        child: child,
      ),
    );
  }

  static Page<dynamic> Function(BuildContext context, GoRouterState state)
      getSlidePageBuilder({
    required Widget Function(BuildContext, GoRouterState) buildPage,
  }) {
    return (context, state) => TransitionFactory._getSlideTransitionPage(
          context: context,
          state: state,
          child: buildPage(context, state),
        );
  }
}
