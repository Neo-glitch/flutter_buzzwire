import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/core/domain/validators/email_validator.dart';
import 'package:buzzwire/core/domain/validators/password_validator.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/check_email_verification_status_usecases.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/fetch_and_cache_user_usecase.dart';
import 'package:buzzwire/src/features/auth/presentation/auth_controller.dart';
import 'package:buzzwire/src/features/auth/presentation/auth_state.dart';
import 'package:buzzwire/src/features/auth/presentation/signin/riverpod/signin_state.dart';
import 'package:buzzwire/core/domain/usecase/save_device_token_usecase.dart';
import 'package:buzzwire/core/domain/usecase/subscribe_to_topic_usecase.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_usecase.dart';
import 'package:buzzwire/core/ui/model/load_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/usecase/signin_usecase.dart';
import 'package:buzzwire/core/domain/usecase/signout_usecase.dart';

part 'sigin_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  late SignInUseCase _signIn;
  late SignOutUseCase _signOut;
  late CheckEmailVerificationStatusUseCase _verifyEmail;
  late FetchAndCacheUserUseCase _fetchAndCacheUser;
  late SaveDeviceTokenUsecase _saveDeviceTokenUsecase;
  late GetCachedUserUseCase _getCachedUserUseCase;
  late SubscribeToTopicUsecase _subscribeToTopicUsecase;

  @override
  SigninState build() {
    _signIn = injector();
    _signOut = injector();
    _verifyEmail = injector();
    _fetchAndCacheUser = injector();
    _saveDeviceTokenUsecase = injector();
    _getCachedUserUseCase = injector();
    _subscribeToTopicUsecase = injector();
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
      (user) => _handleUserVerification(user),
    );
  }

  Future<void> _handleUserVerification(User user) async {
    final verificationResult = await _verifyEmail(NoParams());

    verificationResult.fold(
      (failure) {
        state = state.copyWith(loadState: Error(message: failure.message));
      },
      (isVerified) => _handleVerificationSuccess(user, isVerified),
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
        _saveDeviceToken(user.uid);
      },
    );
  }

  Future<void> _saveDeviceToken(String userId) async {
    await _saveDeviceTokenUsecase(userId);
    await _subscribeToTopicsOfInterest();
  }

  Future<void> _subscribeToTopicsOfInterest() async {
    final user = _getCachedUserUseCase(NoParams()).getOrElse((l) => null);
    for (final topic in user!.topicsFollowing) {
      await _subscribeToTopicUsecase(topic);
    }
    state = state.copyWith(loadState: const Loaded());
    ref
        .read(authControllerProvider.notifier)
        .setAuthState(AuthStatus.authenticated);
  }

  void validateEmail(String email) {
    final isEmailValid = EmailValidator.isValid(email);
    state = state.copyWith(isEmailValid: isEmailValid);
  }

  void validatePassword(String password) {
    final isPasswordValid = PasswordValidator.isValid(password);
    state = state.copyWith(isPasswordValid: isPasswordValid);
  }
}
