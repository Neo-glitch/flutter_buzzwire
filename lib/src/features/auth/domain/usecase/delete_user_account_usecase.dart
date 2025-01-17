import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/auth/domain/repository/auth_repository.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/reauthenticate_user_usecase.dart';
import 'package:buzzwire/src/features/notification/domain/repository/notification_repository.dart';
import 'package:buzzwire/src/features/profile/domain/repository/profile_repository.dart';
import 'package:buzzwire/src/shared/domain/entity/user_entity.dart';
import 'package:fpdart/fpdart.dart';

class DeleteUserAccountUseCase
    implements UseCaseFutureVoid<DeleteUserAccountParam> {
  final AuthRepository authRepo;
  final ProfileRepository profileRepo;
  final NotificationRepository notificationRepo;
  final ReAuthenticateUserUseCase reAuthenticateUser;

  DeleteUserAccountUseCase({
    required this.authRepo,
    required this.profileRepo,
    required this.reAuthenticateUser,
    required this.notificationRepo,
  });

  @override
  Future<Either<Failure, void>> call(DeleteUserAccountParam param) async {
    final reAuthenticationResult = await reAuthenticateUser(
      ReAuthtenticateUserParam(
        email: param.userEntity.email,
        password: param.password,
      ),
    );

    return reAuthenticationResult.fold(
      (failure) => Left(failure),
      (_) async => _deleteDeviceToken(param.userEntity),
    );
  }

  Future<Either<Failure, void>> _deleteDeviceToken(
    UserEntity userEntity,
  ) async {
    final result =
        await notificationRepo.deleteUserDeviceTokens(userEntity.userId);
    return result.fold(
      (failure) => Left(failure),
      (_) async => _deleteUserAccount(userEntity),
    );
  }

  Future<Either<Failure, void>> _deleteUserAccount(
    UserEntity userEntity,
  ) async {
    final profileDeletionResult = await profileRepo.deleteUser(userEntity);
    return profileDeletionResult.fold(
      (failure) => Left(failure),
      (_) async {
        await authRepo.deleteAccount();
        return const Right(unit);
      },
    );
  }
}

class DeleteUserAccountParam {
  final String password;
  final UserEntity userEntity;

  DeleteUserAccountParam({
    required this.userEntity,
    required this.password,
  });
}
