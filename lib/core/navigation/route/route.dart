const String onBoardingScreen = "onboarding_screen";
const String signInScreen = "signin_screen";
const String signUpScreen = "signup_screen";

// screens in bottom nav wrapper screen
const String homeScreen = "home_screen";
const String discoverScreen = "discover_screen";
const String savedNewsScreen = "saved_news_screen";
const String profileScreen = "profile_screen";

const String newsDetailScreen = "news_details_screen";
const String settingsScreen = "settings_screen";

class BuzzWireRoute {
  final String path;
  final String name;

  BuzzWireRoute({required this.path, required this.name});

  // auth
  static BuzzWireRoute onBoardingScreen =
      BuzzWireRoute(path: "/onboarding", name: "onboarding_screen");
  static BuzzWireRoute signInScreen =
      BuzzWireRoute(path: "/sign_in", name: "sign_in_screen");
  static BuzzWireRoute signUpScreen =
      BuzzWireRoute(path: "sign_up", name: "sign_up_screen");
  static BuzzWireRoute preferredTopicsSetupScreen = BuzzWireRoute(
      path: "preferred_topics_setup", name: "preferred_topics_setup_screen");
  static BuzzWireRoute verifyEmailScreen =
      BuzzWireRoute(path: "verify_email", name: "verify_email_screen");
  static BuzzWireRoute passwordResetScreen =
      BuzzWireRoute(path: "password_reset", name: "password_reset_screen");

  static BuzzWireRoute homeScreen =
      BuzzWireRoute(path: "/", name: "home_screen");
  static BuzzWireRoute discoverScreen =
      BuzzWireRoute(path: "/discover", name: "discover_screen");
  static BuzzWireRoute newsByTopicScreen =
      BuzzWireRoute(path: "news_by_topic", name: "news_by_topic_screen");
  static BuzzWireRoute searchNewsScreen =
      BuzzWireRoute(path: "search_news", name: "search_news_screen");
  static BuzzWireRoute savedNewsScreen =
      BuzzWireRoute(path: "/saved_news", name: "saved_news_screen");
  static BuzzWireRoute editProfileScreen =
      BuzzWireRoute(path: "/edit_profile", name: "edit_profile_screen");
  static BuzzWireRoute deleteAccountScreen =
      BuzzWireRoute(path: "/delete_account", name: "delete_account_screen");
  static BuzzWireRoute changePasswordScreen =
      BuzzWireRoute(path: "/change_password", name: "change_password_screen");

  static BuzzWireRoute newsDetailScreen =
      BuzzWireRoute(path: "/news_details", name: "news_details_screen");

  static BuzzWireRoute newsDetailWebViewScreen = BuzzWireRoute(
      path: "news_details_webview", name: "news_details_webview_screen");

  static BuzzWireRoute webview =
      BuzzWireRoute(path: "/webview", name: "webview");
  static BuzzWireRoute settingsScreen =
      BuzzWireRoute(path: "/settings", name: "settings_screen");
  static BuzzWireRoute preferredTopicsScreen =
      BuzzWireRoute(path: "/preferred_topics", name: "preferred_topics_screen");
  static BuzzWireRoute forceUpdateDialog =
      BuzzWireRoute(path: "/force_update", name: "force_update_dialog");
}
