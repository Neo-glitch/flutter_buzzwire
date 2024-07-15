import 'package:buzzwire/core/utils/extensions/string_extensions.dart';
import 'package:buzzwire/src/features/auth/presentation/forgot_password/riverpod/forgot_password_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password_controller.g.dart';

@riverpod
class ForgotPasswordController extends _$ForgotPasswordController {
  @override
  ForgotPasswordState build() {
    return const ForgotPasswordState();
  }

  void validateEmail(String email) {
    final isEmailValid = email.isValidEmail(email);
    state = state.copyWith(isEmailValid: isEmailValid);
  }
}
