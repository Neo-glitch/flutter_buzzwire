import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/check_email_verification_status_usecases.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/fetch_and_cache_user_usecase.dart';
import 'package:buzzwire/src/features/auth/presentation/auth_controller.dart';
import 'package:buzzwire/src/features/auth/presentation/auth_state.dart';
import 'package:buzzwire/src/features/auth/presentation/signin/riverpod/signin_state.dart';
import 'package:buzzwire/src/features/notification/domain/usecases/save_device_token_usecase.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/usecase/signin_usecase.dart';
import '../../../domain/usecase/signout_usecase.dart';

part 'sigin_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  late SignInUseCase _signIn;
  late SignOutUseCase _signOut;
  late CheckEmailVerificationStatusUseCase _verifyEmail;
  late FetchAndCacheUserUseCase _fetchAndCacheUser;
  late SaveDeviceTokenUsecase _saveDeviceTokenUsecase;

  @override
  SigninState build() {
    _signIn = injector();
    _signOut = injector();
    _verifyEmail = injector();
    _fetchAndCacheUser = injector();
    _saveDeviceTokenUsecase = injector();
    return const SigninState();
  }

  void signIn({required String email, required String password}) async {
    state = state.copyWith(loadState: const Loading());
    final response =
        await _signIn(SignInParams(email: email, password: password));

    response.fold(
      (failure) {
        state = state.copyWith(loadState: Error(message: failure.message));
      },
      (user) async => await _handleUserVerification(user),
    );
  }

  Future<void> _handleUserVerification(User user) async {
    final verificationResult = await _verifyEmail(NoParams());

    verificationResult.fold(
      (failure) {
        state = state.copyWith(loadState: Error(message: failure.message));
      },
      (isVerified) async => await _handleVerificationSuccess(user, isVerified),
    );
  }

  Future<void> _handleVerificationSuccess(User user, bool isVerified) async {
    if (!isVerified) {
      await _signOut(NoParams());
      state = state.copyWith(
        loadState: const Error(message: "Email not verified"),
      );
      return;
    }

    final userResult = await _fetchAndCacheUser(user.uid);
    userResult.fold(
      (failure) =>
          state = state.copyWith(loadState: Error(message: failure.message)),
      (_) {
        state = state.copyWith(loadState: const Loaded());
        ref
            .read(authControllerProvider.notifier)
            .setAuthState(AuthStatus.authenticated);
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
}
