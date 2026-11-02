import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/entity/user_entity.dart';
import 'package:buzzwire/core/domain/repository/auth_repository.dart';
import 'package:buzzwire/core/domain/repository/notification_repository.dart';
import 'package:buzzwire/core/domain/repository/profile_repository.dart';
import 'package:buzzwire/core/domain/usecase/reauthenticate_user_usecase.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
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
      (_) async => _deleteProfile(userEntity),
    );
  }

  Future<Either<Failure, void>> _deleteProfile(UserEntity userEntity) async {
    final result = await profileRepo.deleteUser(userEntity);
    return result.fold(
      (failure) => Left(failure),
      (_) async => _deleteAuthAccount(),
    );
  }

  /// Runs last: once the Auth account is gone, security rules no longer let
  /// the client delete the user's data.
  Future<Either<Failure, void>> _deleteAuthAccount() async {
    final result = await authRepo.deleteAccount();
    return result.fold(
      (failure) => Left(failure),
      (_) async {
        await profileRepo.clearCachedUser();
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
