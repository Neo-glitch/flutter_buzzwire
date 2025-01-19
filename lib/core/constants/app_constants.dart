class BuzzWireAppConstants {
  BuzzWireAppConstants._();

  // network constants
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

  // appwrite
  static const String appWriteBaseUrl = "https://cloud.appwrite.io/v1";
  static const String appWriteprofileImageBucketId = "678a900d000e723191ca";
  static const String appWriteTopicsImageBucketId = "678a8cf300024dd7f60c";

  static const String devEmail = "nwekeemmanuel247@gmail.com";
}
