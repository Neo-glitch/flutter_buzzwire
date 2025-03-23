import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/reset_password_usecase.dart';
import 'package:buzzwire/src/features/auth/presentation/forgot_password/riverpod/forgot_password_state.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password_controller.g.dart';

@riverpod
class ForgotPasswordController extends _$ForgotPasswordController {
  late ResetPasswordUseCase _resetPassword;
  @override
  ForgotPasswordState build() {
    _resetPassword = injector();
    return const ForgotPasswordState();
  }

  void resetPassword({required String email}) async {
    state = state.copyWith(loadState: const Loading());
    final response = await _resetPassword(ResetPasswordParams(email: email));

    response.fold(
      (failure) =>
          state = state.copyWith(loadState: Error(message: failure.message)),
      (success) => state = state.copyWith(loadState: const Loaded()),
    );
  }

  void validateEmail(String email) {
    final isEmailValid = email.isValidEmail();
    state = state.copyWith(isEmailValid: isEmailValid);
  }
}
