import 'route.dart';
import '../../main_wrapper.dart';
import '../../src/features/auth/domain/usecase/signin_usecase.dart';
import '../../src/features/auth/presentation/app_entry/app_entry_controller.dart';
import '../../src/features/auth/presentation/auth_controller.dart';
import '../../src/features/auth/presentation/auth_state.dart';
import '../../src/features/auth/presentation/onboarding/riverpod/onboarding_state.dart';
import '../../src/features/auth/presentation/onboarding/screens/onboarding_screen.dart';
import '../../src/features/auth/presentation/forgot_password/forgot_password_screen.dart';
import '../../src/features/auth/presentation/signin/signin_screen.dart';
import '../../src/features/auth/presentation/signup/signup_screen.dart';
import '../../src/features/auth/presentation/signup/verify_email_screen.dart';
import '../../src/features/news/presentation/news_details/news_details_screen.dart';
import '../../src/features/news/presentation/news_details/news_webview_screen.dart';
import '../../src/features/news/presentation/news_headlines/news_headlines_screen.dart';
import '../../src/features/news/presentation/news_home/home_screen.dart';
import '../../src/features/news/presentation/saved_news/saved_news_screen.dart';
import '../../src/features/profile/presentation/profile_screen.dart';
import '../../src/features/settings/presentation/settings_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

// NavigatorKeys
// This is super important - otherwise, we would throw away the whole widget tree when the provider is updated.
final rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "root_navigator");
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
  final appEntryState = ref.watch(appEntryControllerProvider);

  return _previousRouter = GoRouter(
      debugLogDiagnostics: kDebugMode,
      navigatorKey: rootNavigatorKey,
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
              path: BuzzWireRoute.verifyEmail.path,
              name: BuzzWireRoute.verifyEmail.name,
              builder: (context, state) {
                return VerifyEmailScreen();
              },
            ),
            GoRoute(
              path: BuzzWireRoute.passwordReset.path,
              name: BuzzWireRoute.passwordReset.name,
              builder: (context, state) {
                return ForgotPasswordScreen();
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
                    return NewsHeadlinesScreen();
                  },
                )
              ],
            ),
            StatefulShellBranch(
              navigatorKey: savedNavigatorKey,
              routes: [
                GoRoute(
                  path: BuzzWireRoute.savedNews.path,
                  name: BuzzWireRoute.savedNews.name,
                  builder: (context, state) {
                    return SavedNewsScreen();
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
                    return ProfileScreen();
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
        final hasOpenedApp = appEntryState == true;
        // final inLoginScreen =
        //     state.matchedLocation == BuzzWireRoute.signIn.path;
        final inLoginRoute =
            state.matchedLocation.startsWith(BuzzWireRoute.signIn.path);
        final isLoggedIn = authState.authStatus == AuthStatus.authenticated;

        // hasn't gotten past onboarding screen
        if (!hasOpenedApp) {
          return BuzzWireRoute.onBoarding.path;
        }

        // not logged in and not in signin, signup, reset password, or verify email screen
        if (!isLoggedIn) {
          return inLoginRoute ? null : BuzzWireRoute.signIn.path;
        }

        // user is logged in and still in signin, signup, reset password, or verify email screen
        if (isLoggedIn) {
          if (inLoginRoute) {
            return BuzzWireRoute.home.path;
          }
        }

        return null;
      });
}
