import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/auth/domain/repository/auth_repository.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/reauthenticate_user_usecase.dart';
import 'package:buzzwire/src/shared/domain/entity/user_entity.dart';
import 'package:fpdart/src/either.dart';

class ChangePasswordUseCase implements UseCaseFutureVoid<ChangePasswordParam> {
  final AuthRepository authRepo;
  final ReAuthenticateUserUseCase reAuthenticateUser;

  ChangePasswordUseCase(
      {required this.authRepo, required this.reAuthenticateUser});

  @override
  Future<Either<Failure, void>> call(ChangePasswordParam param) async {
    final reAuthenticationResult = await reAuthenticateUser(
      ReAuthtenticateUserParam(
        email: param.userEntity.email,
        password: param.password,
      ),
    );

    return reAuthenticationResult.fold((failure) => Left(failure),
        (_) async => await authRepo.changePassword(param.newPassword));
  }
}

class ChangePasswordParam {
  final String password;
  final String newPassword;
  final UserEntity userEntity;

  ChangePasswordParam({
    required this.password,
    required this.newPassword,
    required this.userEntity,
  });
}
