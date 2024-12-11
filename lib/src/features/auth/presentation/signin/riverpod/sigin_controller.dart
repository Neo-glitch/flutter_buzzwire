import 'package:buzzwire/core/common/riverpod/load_state.dart';
import 'package:buzzwire/core/error/enums/fb_auth_error_type.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/src/features/auth/presentation/auth_controller.dart';
import 'package:buzzwire/src/features/auth/presentation/auth_state.dart';
import 'package:buzzwire/src/features/auth/presentation/signin/riverpod/signin_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/usecase/signin_usecase.dart';
import '../../../domain/usecase/signout_usecase.dart';
import '../../../domain/usecase/verify_email_usecase.dart';

part 'sigin_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  late SignIn _signIn;
  late SignOut _signOut;
  late VerifyEmail _verifyEmail;

  @override
  SigninState build() {
    _signIn = ref.read(signInProvider);
    _signOut = ref.read(signOutProvider);
    _verifyEmail = ref.read(verifyEmailProvider);
    return const SigninState();
  }

  void signIn({required String email, required String password}) async {
    state = state.copyWith(loadState: const Loading());
    final result =
        await _signIn(SignInParams(email: email, password: password));

    result.fold(
      (failure) {
        state = state.copyWith(loadState: Error(message: failure.message));
      },
      (result) => verifyEmail(),
    );
  }

  void verifyEmail() async {
    final result = await _verifyEmail(NoParams());

    result.fold(
      (failure) {
        state = state.copyWith(loadState: Error(message: failure.message));
      },
      (isVerified) async {
        if (isVerified) {
          state = state.copyWith(loadState: const Loaded());
          ref
              .read(authControllerProvider.notifier)
              .setAuthState(AuthStatus.authenticated);
        } else {
          await _signOut(NoParams());
          state = state.copyWith(
              loadState: const Error(message: "Email not verified"));
        }
      },
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
