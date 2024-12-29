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
  static BuzzWireRoute onBoarding =
      BuzzWireRoute(path: "/onboarding", name: "onboarding");
  static BuzzWireRoute signIn =
      BuzzWireRoute(path: "/sign_in", name: "sign_in");
  static BuzzWireRoute signUp = BuzzWireRoute(path: "sign_up", name: "sign_up");
  static BuzzWireRoute verifyEmail =
      BuzzWireRoute(path: "verify_email", name: "verify_email");
  static BuzzWireRoute passwordReset =
      BuzzWireRoute(path: "password_reset", name: "password_reset");

  static BuzzWireRoute home = BuzzWireRoute(path: "/", name: "home");
  static BuzzWireRoute discover =
      BuzzWireRoute(path: "/discover", name: "discover");
  static BuzzWireRoute newsByTopic =
      BuzzWireRoute(path: "news_by_topic", name: "news_by_topic");
  static BuzzWireRoute searchNews =
      BuzzWireRoute(path: "search_news", name: "search_news");
  static BuzzWireRoute savedNews =
      BuzzWireRoute(path: "/saved_news", name: "saved_news");
  static BuzzWireRoute editProfile =
      BuzzWireRoute(path: "/edit_profile", name: "edit_profile");

  static BuzzWireRoute newsDetails =
      BuzzWireRoute(path: "/news_details", name: "news_details");

  static BuzzWireRoute webview =
      BuzzWireRoute(path: "/webview", name: "webview");
  static BuzzWireRoute settings =
      BuzzWireRoute(path: "/settings", name: "settings");
}
