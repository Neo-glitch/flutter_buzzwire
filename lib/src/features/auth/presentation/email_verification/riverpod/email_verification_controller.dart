// controller for verify email screen
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/send_verification_email_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/verify_email_usecase.dart';
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
  late VerifyEmail _verifyEmail;

  @override
  EmailVerificationState build() {
    _signIn = injector();
    _signOut = injector();
    _sendVerificationEmail = injector();
    _verifyEmail = injector();
    return const EmailVerificationState();
  }

  void signInAndSendEmailVerificationMail({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(loadState: const Loading());
    final response =
        await _signIn(SignInParams(email: email, password: password));

    response.fold(
      (failure) {
        state = state.copyWith(loadState: Error(message: failure.message));
      },
      (user) => sendVerificationIfNeeded(),
    );
  }

  void sendVerificationIfNeeded() async {
    final response = await _verifyEmail(NoParams());

    response.fold(
      (failure) =>
          state = state.copyWith(loadState: Error(message: failure.message)),
      (isVerified) async {
        if (isVerified) {
          await signOut();
          state = state.copyWith(
              loadState: const Error(message: "Email already verified"));
        } else {
          sendVerificationEmail();
        }
      },
    );
  }

  void sendVerificationEmail() async {
    final response = await _sendVerificationEmail(NoParams());

    response.fold(
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
    final response = await _signOut(NoParams());

    response.fold(
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
