import 'package:buzzwire/src/features/news/data/model/article_model.dart';
import 'package:buzzwire/src/features/notification/data/model/notification_type.dart';

class PushNotificationData {
  final NotificationType type;
  final ArticleModel? article;

  PushNotificationData({required this.type, this.article});
}
