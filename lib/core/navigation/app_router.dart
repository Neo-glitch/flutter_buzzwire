import 'package:buzzwire/core/navigation/transition_factory.dart';
import 'package:buzzwire/src/features/auth/presentation/signup/screens/preferred_topics_setup_screen.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/news_by_topic_screen.dart';
import 'package:buzzwire/src/features/news/presentation/screens/home_screen.dart';
import 'package:buzzwire/src/features/news/presentation/screens/news_detail_screen.dart';
import 'package:buzzwire/src/features/news/presentation/screens/search_news_screen.dart';
import 'package:buzzwire/src/features/notification/domain/entity/topic_entity.dart';
import 'package:buzzwire/src/features/settings/presentation/screens/change_password_screen.dart';
import 'package:buzzwire/src/features/settings/presentation/screens/delete_account_screen.dart';
import 'package:buzzwire/src/features/settings/presentation/screens/preferred_topics_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../src/features/auth/presentation/app_entry/app_entry_controller.dart';
import '../../src/features/auth/presentation/auth_controller.dart';
import '../../src/features/auth/presentation/auth_state.dart';
import '../../src/features/auth/presentation/email_verification/screens/email_verification_screen.dart';
import '../../src/features/auth/presentation/forgot_password/screens/forgot_password_screen.dart';
import '../../src/features/auth/presentation/onboarding/screens/onboarding_screen.dart';
import '../../src/features/auth/presentation/signin/screens/signin_screen.dart';
import '../../src/features/auth/presentation/signup/screens/signup_screen.dart';
import '../../src/features/news/presentation/screens/discover_screen.dart';
import '../../src/features/news/presentation/screens/news_detail_webview_screen.dart';
import '../../src/features/news/presentation/screens/news_webview_screen.dart';
import '../../src/features/news/presentation/screens/saved_news_screen.dart';
import '../../src/features/profile/presentation/screens/edit_profile_screen.dart';
import '../../src/features/settings/presentation/screens/settings_screen.dart';
import '../../src/home_wrapper.dart';
import 'route.dart';

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
final settingsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "settings_navigator");
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
            return const SignInScreen();
          },
          routes: [
            GoRoute(
              path: BuzzWireRoute.preferredTopicsSetup.path,
              name: BuzzWireRoute.preferredTopicsSetup.name,
              pageBuilder: TransitionFactory.getSlidePageBuilder(
                buildPage: (ctx, state) => const PreferredTopicsSetupScreen(),
              ),
            ),
            GoRoute(
              path: BuzzWireRoute.signUp.path,
              name: BuzzWireRoute.signUp.name,
              pageBuilder: TransitionFactory.getSlidePageBuilder(
                buildPage: (ctx, state) {
                  final topics = state.extra! as List<TopicEntity>;
                  return SignUpScreen(
                    topicsOfInterest: topics,
                  );
                },
              ),
            ),
            GoRoute(
              path: BuzzWireRoute.verifyEmail.path,
              name: BuzzWireRoute.verifyEmail.name,
              pageBuilder: TransitionFactory.getSlidePageBuilder(
                buildPage: (ctx, state) => const EmailVerificationScreen(),
              ),
            ),
            GoRoute(
              path: BuzzWireRoute.passwordReset.path,
              name: BuzzWireRoute.passwordReset.name,
              pageBuilder: TransitionFactory.getSlidePageBuilder(
                buildPage: (ctx, state) => const ForgotPasswordScreen(),
              ),
            )
          ],
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return HomeWrapperScreen(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: homeNavigatorKey,
              routes: [
                GoRoute(
                  path: BuzzWireRoute.home.path,
                  name: BuzzWireRoute.home.name,
                  builder: (context, state) {
                    return const HomeScreen();
                  },
                )
              ],
            ),
            StatefulShellBranch(
              navigatorKey: discoverNavigatorKey,
              routes: [
                GoRoute(
                    path: BuzzWireRoute.discover.path,
                    name: BuzzWireRoute.discover.name,
                    builder: (context, state) {
                      return const DiscoverScreen();
                    },
                    routes: [
                      GoRoute(
                        path: BuzzWireRoute.searchNews.path,
                        name: BuzzWireRoute.searchNews.name,
                        pageBuilder: TransitionFactory.getSlidePageBuilder(
                          buildPage: (ctx, state) => const SearchNewsScreen(),
                        ),
                      ),
                      GoRoute(
                        path: BuzzWireRoute.newsByTopic.path,
                        name: BuzzWireRoute.newsByTopic.name,
                        pageBuilder: TransitionFactory.getSlidePageBuilder(
                          buildPage: (ctx, state) {
                            final topic = state.extra! as String;
                            return NewsByTopicScreen(topic: topic);
                          },
                        ),
                      ),
                    ])
              ],
            ),
            StatefulShellBranch(
              navigatorKey: savedNavigatorKey,
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
              navigatorKey: settingsNavigatorKey,
              routes: [
                GoRoute(
                  path: BuzzWireRoute.settings.path,
                  name: BuzzWireRoute.settings.name,
                  builder: (context, state) {
                    return const SettingsScreen();
                  },
                )
              ],
            ),
          ],
        ),
        GoRoute(
          path: BuzzWireRoute.newsDetail.path,
          name: BuzzWireRoute.newsDetail.name,
          // builder: (ctx, state) {
          //   final article = state.extra! as ArticleEntity;
          //   return NewsDetailScreen(article: article);
          // },
          pageBuilder: TransitionFactory.getSlidePageBuilder(
            buildPage: (ctx, state) {
              final article = state.extra! as ArticleEntity;
              return NewsDetailScreen(article: article);
            },
          ),
          routes: [
            GoRoute(
              path: BuzzWireRoute.newsDetailWebView.path,
              name: BuzzWireRoute.newsDetailWebView.name,
              pageBuilder: TransitionFactory.getSlidePageBuilder(
                buildPage: (ctx, state) {
                  final articleUrl = state.extra! as String;
                  return NewsDetailWebViewScreen(articleUrl: articleUrl);
                },
              ),
            ),
          ],
        ),
        GoRoute(
          path: BuzzWireRoute.editProfile.path,
          name: BuzzWireRoute.editProfile.name,
          pageBuilder: TransitionFactory.getSlidePageBuilder(
            buildPage: (ctx, state) => const EditProfileScreen(),
          ),
        ),
        GoRoute(
          path: BuzzWireRoute.deleteAccount.path,
          name: BuzzWireRoute.deleteAccount.name,
          pageBuilder: TransitionFactory.getSlidePageBuilder(
            buildPage: (ctx, state) => const DeleteAccountScreen(),
          ),
        ),
        GoRoute(
          path: BuzzWireRoute.changePassword.path,
          name: BuzzWireRoute.changePassword.name,
          pageBuilder: TransitionFactory.getSlidePageBuilder(
            buildPage: (ctx, state) => const ChangePasswordScreen(),
          ),
        ),
        GoRoute(
          path: BuzzWireRoute.preferredTopics.path,
          name: BuzzWireRoute.preferredTopics.name,
          pageBuilder: TransitionFactory.getSlidePageBuilder(
            buildPage: (ctx, state) => const PreferredTopicsScreen(),
          ),
        ),
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
          // return inLoginRoute ? null : BuzzWireRoute.signIn.path;
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
