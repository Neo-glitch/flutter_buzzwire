import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/notification/domain/repository/notification_repository.dart';
import 'package:fpdart/src/either.dart';

class DeleteDeviceTokenUsecase implements UseCaseFutureVoid<String> {
  final NotificationRepository notificationRepo;

  DeleteDeviceTokenUsecase({required this.notificationRepo});

  @override
  Future<Either<Failure, void>> call(String param) {
    return notificationRepo.deleteDeviceToken(param);
  }
}
