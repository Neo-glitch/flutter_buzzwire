import 'package:buzzwire/src/features/auth/domain/usecase/reset_password_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/send_verification_email_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/verify_email_usecase.dart';

import '../../../../core/usecase/usecase.dart';
import '../data/repository/auth_repository_impl.dart';
import '../domain/usecase/signin_usecase.dart';
import '../domain/usecase/signout_usecase.dart';
import '../domain/usecase/signup_usecase.dart';
import 'auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  Stream<User?> get authUser =>
      ref.watch(authRepositoryProvider).authStateChanges();
  late SignIn _sign;
  late SignOut _signOut;
  late SignUp _signUp;
  late VerifyEmail _verifyEmail;
  late SendVerificationEmail _sendVerificationEmail;
  late ResetPassword _resetPassword;

  @override
  AuthState build() {
    _sign = ref.read(signInProvider);
    _signOut = ref.read(signOutProvider);
    _signUp = ref.read(signUpProvider);
    _verifyEmail = ref.read(verifyEmailProvider);
    _sendVerificationEmail = ref.read(sendVerificationEmailProvider);
    _resetPassword = ref.read(resetPasswordProvider);
    return const AuthState();
  }

  void signIn({required String email, required String password}) async {
    state = state.copyWith(isLoading: true);
    final result = await _sign(SignInParams(email: email, password: password));

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          authStatus: AuthStatus.unAuthenticated,
          errorMessage: failure.message,
        );
      },
      (user) async {
        final isEmailVerified = await verifySignInEmail();

        if (isEmailVerified) {
          state = state.copyWith(
            isLoading: false,
            authStatus: AuthStatus.authenticated,
            isSignInEmailUnverified: false,
          );
        } else {
          state = state.copyWith(
            isLoading: false,
            errorMessage: null,
            isSignInEmailUnverified: true,
          );
        }
      },
    );
  }

  void signUp({required String email, required String password}) async {
    state = state.copyWith(isLoading: true);
    final result =
        await _signUp(SignUpParams(email: email, password: password));

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          authStatus: AuthStatus.unAuthenticated,
          errorMessage: failure.message,
        );
      },
      (user) {
        state = state.copyWith(
          isLoading: false,
          authStatus: AuthStatus.registered,
          errorMessage: null,
        );
      },
    );
  }

  void signOut() async {
    state = state.copyWith(isLoading: true);
    final result = await _signOut(NoParams());

    result.fold(
      (failure) {
        state = state.copyWith(
          errorMessage: failure.message,
        );
      },
      (result) {
        state = state.copyWith(
          authStatus: AuthStatus.unAuthenticated,
          errorMessage: null,
        );
      },
    );
  }

  void sendVerificationEmail() async {
    state = state.copyWith(isLoading: true);
    final result = await _sendVerificationEmail(NoParams());

    result.fold(
      (failure) {
        state = state.copyWith(errorMessage: failure.message, isLoading: false);
      },
      (_) {
        state = state.copyWith(
            errorMessage: null,
            isLoading: false,
            isEmailVerificationMailSent: true);
      },
    );
  }

  Future<bool> verifySignInEmail() async {
    state = state.copyWith(isLoading: true);
    final result = await _verifyEmail(NoParams());

    return result.fold(
      (failure) {
        return false;
      },
      (isVerified) {
        return isVerified;
      },
    );
  }

  void verifySignUpEmail() async {
    final result = await _verifyEmail(NoParams());

    result.fold(
      (failure) {},
      (isVerified) {
        if (isVerified) {
          state = state.copyWith(
            isLoading: false,
            errorMessage: null,
            authStatus: AuthStatus.registeredAndVerified,
          );
        }
      },
    );
  }

  void resetPassword(String email) async {
    state = state.copyWith(isLoading: true);

    final result = await _resetPassword(ResetPasswordParams(email: email));

    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
      },
      (result) {
        state = state.copyWith(isLoading: false, isPasswordResetMailSent: true);
      },
    );
  }

  void hasSeenError() {
    state = state.copyWith(errorMessage: null);
  }

  void hasSentVerificationEmail() {
    state = state.copyWith(isEmailVerificationMailSent: false);
  }

  void hasSentPasswordResetEmail() {
    state = state.copyWith(isPasswordResetMailSent: false);
  }
}
