import 'package:buzzwire/core/error/error_text.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/change_password_usecase.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_usecase.dart';
import 'package:buzzwire/src/features/settings/presentation/riverpod/change_password_state.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
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
    final isPasswordValid = password.isValidPassword();
    state = state.copyWith(isOldPasswordValid: isPasswordValid);
  }

  void validateNewPassword(String password, String oldPassword) {
    final isPasswordValid =
        password.isValidPassword() && password != oldPassword;
    state = state.copyWith(isNewPasswordValid: isPasswordValid);
  }

  void validateConfirmPassword(String password, String newPassword) {
    final isPasswordValid =
        password.isValidPassword() && password == newPassword;
    state = state.copyWith(isConfirmPasswordValid: isPasswordValid);
  }
}
