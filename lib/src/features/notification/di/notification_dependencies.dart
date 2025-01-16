import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/notification/data/datasources/remote/notification_remote_datasource.dart';
import 'package:buzzwire/src/features/notification/data/repository/notification_repository_impl.dart';
import 'package:buzzwire/src/features/notification/domain/repository/notification_repository.dart';
import 'package:buzzwire/src/features/notification/domain/usecases/delete_device_token_usecase.dart';
import 'package:buzzwire/src/features/notification/domain/usecases/get_topics_usecase.dart';
import 'package:buzzwire/src/features/notification/domain/usecases/save_device_token_usecase.dart';
import 'package:buzzwire/src/features/notification/domain/usecases/subscribe_to_topic_usecase.dart';
import 'package:buzzwire/src/features/notification/domain/usecases/unsubscribe_from_topic_usecase.dart';

Future<void> provideNotificationDependencies() async {
  injector.registerFactory<NotificationRemoteDatasource>(() =>
      NotificationRemoteDatasourceImpl(
          firestore: injector(), messaging: injector()));

  injector.registerFactory<NotificationRepository>(() =>
      NotificationRepositoryImpl(
          remoteDatasource: injector(), networkConnectionChecker: injector()));

  injector.registerFactory<DeleteDeviceTokenUsecase>(
    () => DeleteDeviceTokenUsecase(
      notificationRepo: injector(),
    ),
  );

  injector.registerFactory<SaveDeviceTokenUsecase>(
    () => SaveDeviceTokenUsecase(
      notificationRepo: injector(),
    ),
  );

  injector.registerFactory<GetTopicsUsecase>(
    () => GetTopicsUsecase(
      notificationRepo: injector(),
    ),
  );

  injector.registerFactory<SubscribeToTopicUsecase>(
    () => SubscribeToTopicUsecase(
      notificationRepo: injector(),
    ),
  );

  injector.registerFactory<UnsubscribeFromTopicUsecase>(
    () => UnsubscribeFromTopicUsecase(
      notificationRepo: injector(),
    ),
  );
}
