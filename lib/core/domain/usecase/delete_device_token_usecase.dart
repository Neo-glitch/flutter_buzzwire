import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/core/domain/repository/notification_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteDeviceTokenUsecase implements UseCaseFutureVoid<String> {
  final NotificationRepository notificationRepo;

  DeleteDeviceTokenUsecase({required this.notificationRepo});

  @override
  Future<Either<Failure, void>> call(String param) {
    return notificationRepo.deleteDeviceToken(param);
  }
}
