import 'package:buzzwire/core/navigation/route.dart';
import 'package:buzzwire/main_wrapper.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/signin_usecase.dart';
import 'package:buzzwire/src/features/auth/presentation/auth_controller.dart';
import 'package:buzzwire/src/features/auth/presentation/onboarding/riverpod/onboarding_state.dart';
import 'package:buzzwire/src/features/auth/presentation/onboarding/screens/onboarding_screen.dart';
import 'package:buzzwire/src/features/auth/presentation/password_reset/password_reset.dart';
import 'package:buzzwire/src/features/auth/presentation/signin/signin_screen.dart';
import 'package:buzzwire/src/features/auth/presentation/signup/signup_screen.dart';
import 'package:buzzwire/src/features/news/presentation/news_details/news_details_screen.dart';
import 'package:buzzwire/src/features/news/presentation/news_details/news_webview_screen.dart';
import 'package:buzzwire/src/features/news/presentation/news_headlines/news_headlines_screen.dart';
import 'package:buzzwire/src/features/news/presentation/news_home/home_screen.dart';
import 'package:buzzwire/src/features/news/presentation/saved_news/saved_news_screen.dart';
import 'package:buzzwire/src/features/profile/presentation/profile_screen.dart';
import 'package:buzzwire/src/features/settings/presentation/settings_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

// NavigatorKeys
// This is super important - otherwise, we would throw away the whole widget tree when the provider is updated.
final navigatorKey = GlobalKey<NavigatorState>(debugLabel: "root_navigator");
final homeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "home_navigator");
final discoverNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "discover_navigator");
final savedNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "saved_news_navigator");
final profileNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "profle_navigator");
// We need to have access to the previous location of the router. Otherwise, we would start from '/' on rebuild.
GoRouter? _previousRouter;

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authControllerProvider);

  return _previousRouter = GoRouter(
      debugLogDiagnostics: kDebugMode,
      navigatorKey: navigatorKey,
      initialLocation:
          _previousRouter?.routerDelegate.currentConfiguration.fullPath,
      routes: [
        GoRoute(
          path: BuzzWireRoute.onBoarding.path,
          name: BuzzWireRoute.onBoarding.name,
          builder: (context, state) => const OnBoardingScreen(),
        ),
        GoRoute(
          path: BuzzWireRoute.signIn.path,
          name: BuzzWireRoute.signIn.name,
          builder: (context, state) {
            return SignInScreen();
          },
          routes: [
            GoRoute(
              path: BuzzWireRoute.signUp.path,
              name: BuzzWireRoute.signUp.name,
              builder: (context, state) {
                return SignUpScreen();
              },
            ),
            GoRoute(
              path: BuzzWireRoute.passwordReset.path,
              name: BuzzWireRoute.passwordReset.name,
              builder: (context, state) {
                return PasswordResetScreen();
              },
            )
          ],
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return MainWrapperScreen(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: homeNavigatorKey,
              routes: [
                GoRoute(
                  path: BuzzWireRoute.home.path,
                  name: BuzzWireRoute.home.name,
                  builder: (context, state) {
                    return HomeScreen();
                  },
                  routes: [
                    GoRoute(
                      path: BuzzWireRoute.newsDetails.path,
                      name: BuzzWireRoute.newsDetails.name,
                      builder: (context, state) {
                        return NewsDetailsScree();
                      },
                    )
                  ],
                )
              ],
            ),
            StatefulShellBranch(
              navigatorKey: discoverNavigatorKey,
              routes: [
                GoRoute(
                  path: BuzzWireRoute.headlines.path,
                  name: BuzzWireRoute.headlines.name,
                  builder: (context, state) {
                    return const NewsHeadlinesScreen();
                  },
                )
              ],
            ),
            StatefulShellBranch(
              navigatorKey: discoverNavigatorKey,
              routes: [
                GoRoute(
                  path: BuzzWireRoute.savedNews.path,
                  name: BuzzWireRoute.savedNews.name,
                  builder: (context, state) {
                    return const SavedNewsScreen();
                  },
                )
              ],
            ),
            StatefulShellBranch(
              navigatorKey: profileNavigatorKey,
              routes: [
                GoRoute(
                  path: BuzzWireRoute.profile.path,
                  name: BuzzWireRoute.profile.name,
                  builder: (context, state) {
                    return const ProfileScreen();
                  },
                )
              ],
            ),
          ],
        ),
        GoRoute(
          path: BuzzWireRoute.webview.path,
          name: BuzzWireRoute.webview.name,
          builder: (context, state) {
            return const WebViewScreen();
          },
        ),
        GoRoute(
          path: BuzzWireRoute.settings.path,
          name: BuzzWireRoute.settings.name,
          builder: (context, state) {
            return const SettingsScreen();
          },
        )
      ],
      redirect: (ctx, state) {
        final inLoginRo
        return null;
      });
}
