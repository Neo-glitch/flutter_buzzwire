import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/notification/domain/entity/topic_entity.dart';
import 'package:buzzwire/src/features/notification/domain/repository/notification_repository.dart';
import 'package:fpdart/src/either.dart';

class GetTopicsUsecase implements UseCaseFuture<List<TopicEntity>, NoParams> {
  final NotificationRepository notificationRepo;

  GetTopicsUsecase({required this.notificationRepo});

  @override
  Future<Either<Failure, List<TopicEntity>>> call(NoParams param) async {
    return await notificationRepo.getTopics();
  }
}
