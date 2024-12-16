/// Contains all the App Texts in String format
class BuzzWireStrings {
  BuzzWireStrings._();
  // Global Texts
  static const String appTitle = 'BuzzWire';

  // OnBoarding Texts
  static const String onBoardingTitle1 = "Stay Informed";
  static const String onBoardingTitle2 = "Breaking Alerts";
  static const String onBoardingTitle3 = "Personalized News";
  static const String onBoardingTitle4 = "Get Started";
  static const String onBoardingSubTitle1 =
      "Get the latest news from trusted sources around the world. Stay updated with real-time news on politics, sports, entertainment, and more.";
  static const String onBoardingSubTitle2 =
      "Get breaking news and top stories. Never miss out on important updates as they happen";
  static const String onBoardingSubTitle3 =
      "Customize your news feed to match your interests. Follow your favorite topics and receive news that matters to you.";
  static const String onBoardingSubTitle4 =
      "You're ready to dive in! Start exploring the latest news tailored to your interests. Stay informed and enjoy a personalized news experience.";

  // Auth
  static const String loginTitleText = "Log into your Account";
  static const String loginSubTitleText =
      "Enter your email and password to login.";
  static const String signupTitleText = "Sign up to BuzzWire";
  static const String signupSubTitleText =
      "Sign up to stay updated with breaking News.";
  static const String forgotPasswordTitle = "Forgot Password?";
  static const String forgotPasswordSubtitle =
      "No worries, we'll send you reset instructions";
  static const String emailVerificationTitle =
      "You didn't receive a verification mail?";
  static const String emailVerificationSubtitle =
      "Input your email and password to get a verification email.";

  // Home
  static const String homeAppBarTitle = "Welcome Back!";
  static const String homeAppBarSubTitle = "Dat App Boy";
  static const String defaultErrorScreenHeaderTitle = "An Error Occured";
  static const String DefaultemptyScreenHeaderTitle = "No Results Found";

  // fontFamily
  static const String poppins = "Poppins";
  static const String merriWeather = "Merriweather";
  static const String playFairDisplay = "PlayfairDisplay";

  // Regex
  static final RegExp validEmailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  static final RegExp validPasswordRegExp =
      RegExp(r'^.{6,}$'); // password must be 6 digits minimum
}
