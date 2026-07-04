import 'package:buzzwire/core/data/error/constant/error_text.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/core/domain/validators/password_validator.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/core/domain/usecase/change_password_usecase.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_usecase.dart';
import 'package:buzzwire/src/features/settings/presentation/change_password/riverpod/change_password_state.dart';
import 'package:buzzwire/core/ui/model/load_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'change_password_controller.g.dart';

@riverpod
class ChangePasswordController extends _$ChangePasswordController {
  late ChangePasswordUseCase _changePasswordUseCase;
  late GetCachedUserUseCase _getCachedUserUseCase;

  @override
  ChangePasswordState build() {
    _changePasswordUseCase = injector();
    _getCachedUserUseCase = injector();
    return const ChangePasswordState();
  }

  void changePassword(String currentPassword, String newPassword) async {
    state = state.copyWith(loadState: const Loading());
    final user = _getCachedUserUseCase(NoParams()).getOrElse((l) => null);

    if (user == null) {
      state = state.copyWith(
          loadState: const Error(message: ErrorText.unknownError));
      return;
    }

    final changePasswordResult = await _changePasswordUseCase(
      ChangePasswordParam(
        password: currentPassword,
        newPassword: newPassword,
        userEntity: user,
      ),
    );

    changePasswordResult.fold(
      (failure) =>
          state = state.copyWith(loadState: Error(message: failure.message)),
      (_) => state = state.copyWith(loadState: const Loaded()),
    );
  }

  void validateCurrentPassword(String password) {
    final isPasswordValid = PasswordValidator.isValid(password);
    state = state.copyWith(isOldPasswordValid: isPasswordValid);
  }

  void validateNewPassword(String password, String oldPassword) {
    final isPasswordValid =
        PasswordValidator.isValid(password) && password != oldPassword;
    state = state.copyWith(isNewPasswordValid: isPasswordValid);
  }

  void validateConfirmPassword(String password, String newPassword) {
    final isPasswordValid =
        PasswordValidator.isValid(password) && password == newPassword;
    state = state.copyWith(isConfirmPasswordValid: isPasswordValid);
  }
}
