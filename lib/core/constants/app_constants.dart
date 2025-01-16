class BuzzWireAppConstants {
  BuzzWireAppConstants._();

  static const String baseUrl = "https://newsapi.org/v2/";
  static const String news = "everything";
  static const String headlines = "top-headlines";
  static const String sources = "top-headlines/sources";
  static const int pageSize = 20;
  static const String removedArticleUrl = "https://removed.com";

  // firebase db
  static const String usersCollecton = "users";
  static const String articlesCollection = "articlesCollection";
  static const String deviceTokenCollection = "devices";
  static const String topicsCollection = "topics";

  // supabase
  static const String supabaseBaseUrl =
      "https://thlpsjhdzlufnxswjplh.supabase.co";
  static const String imagesBucket = "images";
  static const String imageBucketProfilePath = "profile";
}
