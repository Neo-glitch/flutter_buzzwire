import 'package:buzzwire/src/features/news/data/model/article_model.dart';
import 'package:buzzwire/src/shared/data/model/notification_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'push_notification_data.g.dart';

@JsonSerializable()
class PushNotificationData {
  final NotificationType type;
  final ArticleModel? article;

  PushNotificationData({required this.type, this.article});

  factory PushNotificationData.fromJson(Map<String, dynamic> json) {
    return _$PushNotificationDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PushNotificationDataToJson(this);
}
