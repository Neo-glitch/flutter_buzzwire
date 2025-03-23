import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/core/utils/logging/logger_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class HomeWrapperScreen extends ConsumerStatefulWidget {
  const HomeWrapperScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<HomeWrapperScreen> createState() => _HomeWrapperScreenState();
}

class _HomeWrapperScreenState extends ConsumerState<HomeWrapperScreen> {
  Timer? _exitTimer;
  bool _doubleBackToExitPressedOnce = false;

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(_backButtonInterceptor);
  }

  @override
  void dispose() {
    super.dispose();
    BackButtonInterceptor.remove(_backButtonInterceptor);
  }

  void _startTimer() async {
    _exitTimer?.cancel();
    _doubleBackToExitPressedOnce = true;

    _exitTimer = Timer(
      const Duration(seconds: 2),
      () {
        _doubleBackToExitPressedOnce = false;
      },
    );
  }

  bool _backButtonInterceptor(final bool stop, final RouteInfo routeInfo) {
    // stop back gesture
    GoRouter router = GoRouter.of(context);
    final RouteMatch lastMatch =
        router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : router.routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();
    final bool canPop = GoRouter.of(context).routerDelegate.canPop();

    BuzzWireLoggerHelper.debug(location);
    BuzzWireLoggerHelper.debug(canPop.toString());

    if (canPop) {
      return false;
    }

    if (_doubleBackToExitPressedOnce) {
      return false;
    }

    context.showToast("Press Back again to Exit");
    _startTimer();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView.router(
      handleAndroidBackButtonPress: true,
      backgroundColor: context.backgroundColor,
      tabs: _bottomNavTabs(),
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: context.backgroundColor,
          border: const Border(
            top: BorderSide(width: 0.05, color: BuzzWireColors.darkGrey),
          ),
        ),
      ),
      navigationShell: widget.navigationShell,
    );
  }

  List<PersistentRouterTabConfig> _bottomNavTabs() {
    return [
      PersistentRouterTabConfig(
        item: ItemConfig(
          activeForegroundColor: context.primaryColor,
          icon: const FaIcon(
            FontAwesomeIcons.house,
            size: 20,
          ),
          title: "Home",
        ),
      ),
      PersistentRouterTabConfig(
        item: ItemConfig(
          activeForegroundColor: context.primaryColor,
          icon: const FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            size: 20,
          ),
          title: "Discover",
        ),
      ),
      PersistentRouterTabConfig(
        item: ItemConfig(
          activeForegroundColor: context.primaryColor,
          icon: const FaIcon(
            FontAwesomeIcons.solidBookmark,
            size: 20,
          ),
          title: "Saved",
        ),
      ),
      PersistentRouterTabConfig(
        item: ItemConfig(
          activeForegroundColor: context.primaryColor,
          icon: const FaIcon(
            FontAwesomeIcons.solidUser,
            size: 20,
          ),
          title: "Settings",
        ),
      ),
    ];
  }
}
