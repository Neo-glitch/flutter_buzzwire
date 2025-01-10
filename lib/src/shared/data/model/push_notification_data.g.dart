// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushNotificationData _$PushNotificationDataFromJson(
        Map<String, dynamic> json) =>
    PushNotificationData(
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      article: json['article'] == null
          ? null
          : ArticleModel.fromJson(json['article'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PushNotificationDataToJson(
        PushNotificationData instance) =>
    <String, dynamic>{
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'article': instance.article,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.systemAlert: 'systemAlert',
  NotificationType.newArticle: 'newArticle',
  NotificationType.articleUploadStatus: 'articleUploadStatus',
};
