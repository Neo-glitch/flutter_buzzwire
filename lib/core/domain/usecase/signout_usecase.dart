import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/repository/auth_repository.dart';
import 'package:buzzwire/core/domain/repository/notification_repository.dart';
import 'package:buzzwire/core/domain/repository/profile_repository.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
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
