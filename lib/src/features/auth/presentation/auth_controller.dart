import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/signin_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/signout_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/signup_usecase.dart';
import 'package:buzzwire/src/features/auth/presentation/auth_state.dart';
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

  @override
  AuthState build() {
    _sign = ref.read(signInProvider);
    _signOut = ref.read(signOutProvider);
    _signUp = ref.read(signUpProvider);
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
      (user) {
        state = state.copyWith(
            isLoading: false,
            authStatus: AuthStatus.authenticated,
            errorMessage: null);
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
          authStatus: AuthStatus.authenticated,
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
}
