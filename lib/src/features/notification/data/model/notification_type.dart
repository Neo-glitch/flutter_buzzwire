import 'package:buzzwire/core/utils/extensions/list_extension.dart';

enum NotificationType {
  systemAlert("system_alert"),
  newArticle("new_article"),
  articleUploadStatus("article_upload_status");

  final String jsonName;

  const NotificationType(this.jsonName);

  // Helper method to get NotificationType from jsonName
  static NotificationType? fromJsonName(String jsonName) {
    return NotificationType.values.firstWhereOrNull(
      (type) => type.jsonName == jsonName,
    );
  }
}
