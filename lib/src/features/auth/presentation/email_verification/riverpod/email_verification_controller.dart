// controller for verify email screen
import 'package:buzzwire/core/common/riverpod/load_state.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/core/utils/extensions/string_extensions.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/send_verification_email_usecase.dart';
import 'package:buzzwire/src/features/auth/presentation/email_verification/riverpod/email_verification_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/usecase/signin_usecase.dart';
import '../../../domain/usecase/signout_usecase.dart';

part 'email_verification_controller.g.dart';

@riverpod
class EmailVerificationController extends _$EmailVerificationController {
  late SendVerificationEmail _sendVerificationEmail;
  late SignIn _signIn;
  late SignOut _signOut;

  @override
  EmailVerificationState build() {
    _signIn = ref.read(signInProvider);
    _signOut = ref.read(signOutProvider);
    _sendVerificationEmail = ref.read(sendVerificationEmailProvider);
    return const EmailVerificationState();
  }

  void signInAndResendVerificationEmail({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(loadState: const Loading());
    final result =
        await _signIn(SignInParams(email: email, password: password));

    result.fold(
      (failure) {
        state = state.copyWith(loadState: Error(message: failure.message));
      },
      (user) => sendVerificationEmail(),
    );
  }

  void sendVerificationEmail() async {
    final result = await _sendVerificationEmail(NoParams());

    result.fold(
      (failure) async {
        await signOut();
        state = state.copyWith(loadState: Error(message: failure.message));
      },
      (success) async {
        await signOut();
        state = state.copyWith(loadState: const Loaded());
      },
    );
  }

  Future<void> signOut() async {
    final result = await _signOut(NoParams());

    result.fold(
      (failure) {
        state = state.copyWith(
          loadState: Error(message: failure.message),
        );
      },
      (_) {},
    );
  }

  void validateEmail(String email) {
    final isEmailValid = email.isValidEmail();
    state = state.copyWith(isEmailValid: isEmailValid);
  }

  void validatePassword(String password) {
    final isPasswordValid = password.isValidPassword();
    state = state.copyWith(isPasswordValid: isPasswordValid);
  }

  void hasSeenError() {
    state = state.copyWith(loadState: const Empty());
  }
}
