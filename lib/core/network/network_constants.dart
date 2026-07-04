class NetworkConstants {
  NetworkConstants._();

  // News API endpoint paths
  static const String news = "everything";
  static const String headlines = "top-headlines";
  static const String sources = "top-headlines/sources";
  static const int pageSize = 20;
  static const String removedArticleUrl = "https://removed.com";

  // .env key names — News API
  static const String newsApiKey = "NEWS_API_KEY";
  static const String newsApiBaseUrl = "NEWS_API_BASE_URL";

  // Firestore collection names
  static const String usersCollection = "users";
  static const String articlesCollection = "articlesCollection";
  static const String deviceTokenCollection = "devices";
  static const String topicsCollection = "topics";

  // .env key names — Appwrite
  static const String appWriteProjectId = "APP_WRITE_PROJECT_ID";
  static const String appWriteProfileImageBucketId =
      "APP_WRITE_PROFILE_IMAGE_BUCKET_ID";
  static const String appWriteTopicsImageBucketId =
      "APP_WRITE_TOPICS_IMAGE_BUCKET_ID";
  static const String appWriteBaseUrl = "APP_WRITE_BASE_URL";
}
