import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/core/domain/repository/notification_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class UnsubscribeFromTopicUsecase implements UseCaseFutureVoid<String> {
  final NotificationRepository notificationRepo;

  UnsubscribeFromTopicUsecase({required this.notificationRepo});

  @override
  Future<Either<Failure, void>> call(String param) {
    return notificationRepo.unsubscribeFromTopic(param);
  }
}
