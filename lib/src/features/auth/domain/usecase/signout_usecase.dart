import 'package:buzzwire/src/features/notification/domain/repository/notification_repository.dart';
import 'package:buzzwire/src/features/profile/domain/repository/profile_repository.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class SignOutUseCase implements UseCaseFutureVoid<NoParams> {
  final AuthRepository authRepo;
  final ProfileRepository profileRepo;
  final NotificationRepository notificationRepo;

  SignOutUseCase({
    required this.authRepo,
    required this.profileRepo,
    required this.notificationRepo,
  });

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    await authRepo.signOut();
    await profileRepo.clearCachedUser();
    return const Right(unit);
  }
}
