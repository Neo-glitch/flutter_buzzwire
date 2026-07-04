import 'package:buzzwire/core/data/model/topic_model.dart';

abstract class NotificationRemoteDatasource {
  Future<void> saveDeviceToken(String userId);
  Future<void> deleteUserDeviceTokens(String userId);
  Future<List<TopicModel>> getTopics();
  Future<void> subscribeToTopic(String topic);
  Future<void> unsubscribeFromTopic(String topic);
  Future<void> deleteToken(String userId);
}
