// controller for verify email screen
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/check_email_verification_status_usecases.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/send_verification_email_usecase.dart';
import 'package:buzzwire/src/features/auth/presentation/email_verification/riverpod/email_verification_state.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/usecase/signin_usecase.dart';
import '../../../domain/usecase/signout_usecase.dart';

part 'email_verification_controller.g.dart';

@riverpod
class EmailVerificationController extends _$EmailVerificationController {
  late SendVerificationEmailUseCase _sendVerificationEmail;
  late SignInUseCase _signIn;
  late SignOutUseCase _signOut;
  late CheckEmailVerificationStatusUseCase _verifyEmail;

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
      (user) async => await _handleUserVerification(),
    );
  }

  Future<void> _handleUserVerification() async {
    final verificationResult = await _verifyEmail(NoParams());

    verificationResult.fold(
      (failure) async {
        await signOut();
        state = state.copyWith(loadState: Error(message: failure.message));
      },
      (isVerified) async => await _handleVerificationResult(isVerified),
    );
  }

  Future<void> _handleVerificationResult(bool isVerified) async {
    if (isVerified) {
      await signOut();
      state = state.copyWith(
        loadState: const Error(message: "Email already verified"),
      );
    }

    final result = await _sendVerificationEmail(NoParams());

    result.fold(
      (failure) async {
        await signOut();
        state = state.copyWith(loadState: Error(message: failure.message));
      },
      (_) async {
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
}
