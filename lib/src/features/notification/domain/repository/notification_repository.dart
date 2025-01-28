import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/src/features/notification/domain/entity/topic_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class NotificationRepository {
  Future<Either<Failure, void>> saveDeviceToken(String userId);
  Future<Either<Failure, void>> deleteUserDeviceTokens(String userId);
  Future<Either<Failure, void>> subscribeToTopic(String topic);
  Future<Either<Failure, void>> unsubscribeFromTopic(String topic);
  Future<Either<Failure, void>> deleteDeviceToken(String userId);
  Future<Either<Failure, List<TopicEntity>>> getTopics();
}
