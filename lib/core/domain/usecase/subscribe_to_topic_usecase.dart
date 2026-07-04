import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/core/domain/repository/notification_repository.dart';
import 'package:fpdart/src/either.dart';

class SubscribeToTopicUsecase implements UseCaseFutureVoid<String> {
  final NotificationRepository notificationRepo;

  SubscribeToTopicUsecase({required this.notificationRepo});

  @override
  Future<Either<Failure, void>> call(String param) {
    return notificationRepo.subscribeToTopic(param);
  }
}
