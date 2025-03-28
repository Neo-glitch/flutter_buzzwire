/// Contains all the App Texts in String format
class BuzzWireStrings {
  BuzzWireStrings._();
  // Global Texts
  static const String appTitle = 'BuzzWire';
  static const String searchHistoryTableName = "search_history";
  static const String savedNewsTableName = "saved_news";

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

  // App
  static const String homeAppBarTitle = "Welcome Back!";
  static const String homeAppBarSubTitle = "Dat App Boy";
  static const String defaultErrorScreenHeaderTitle = "An Error Occured";
  static const String defaultEmptyScreenHeaderTitle = "No Results Found";
  static const String cancel = "Cancel";
  static const String error = "Error";
  static const String retry = "Retry";
  static const String alert = "Alert";
  static const String yes = "Yes";
  static const String info = "Info";
  static const String account = "Account";
  static const String settings = "Settings";
  static const String appPreferences = "App Preferences";
  static const String general = "General";
  static const String language = "Language";
  static const String save = "Save";
  static const String theme = "Theme";
  static const String countryAndRegion = "Country & region";
  static const String interests = "Interests";
  static const String profile = "Profile";
  static const String myArticles = "My Articles";
  static const String changePassword = "Change Password";
  static const String signOut = "Sign out";
  static const String deleteAccount = "Delete Account";
  static const String deleteYourAccountQuestion = "Delete your account?";
  static const String permanentlyDeleteYourAccount =
      "Permanently Delete Account";
  static const String permanentlyDeleteAccountDesc =
      "Deleting your account will permanently erase all your data. This includes your profile, activity, and preferences. If you’re sure, enter your password below and click on the button to confirm.";
  static const String deleteAccountScreenDesc =
      "You will loose all your data by deleting your account. This action cannot be undone";
  static const String confirmDeleteAccountDialogDesc =
      "Once you delete your account, there's no getting it back. Make sure you want to do this";
  static const String sendFeedback = "Send Feedback";
  static const String warning = "Warning";
  static const String signOutDialogDesc = "Are you sure you want to sign out?";
  static const String deletingYourAccount = "Deleting Your Account...";
  static const String creatingYourAccount = "Creating Your Account...";
  static const String signingOut = "Signing out..";
  static const String changePasswordScreenDesc =
      "To change your password, please fill in the fields below. Your password must contain at least 6 characters and must be different from the current password";
  static const String readFullArticle = "Read full article";
  static const String chooseTopicsOfInterestDesc =
      "Choose the topics you care about most, and we’ll tailor your news feed to match your interests. Stay updated on what matters to you!";
  static const String newUpdateIsAvailable = "New Update is Available";
  static const String updateYourApplicationToTheLatestVersion =
      "Update your application to the latest version";
  static const String updateApplicationDialogDesc =
      "A brand new version of the BuzzWire app is available in the App Store. Please update your app to use all of our amazing features";
  static const String updateNow = "Update Now!";

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
