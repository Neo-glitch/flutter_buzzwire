import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/create_user_account_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/send_verification_email_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/signout_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/signup_usecase.dart';
import 'package:buzzwire/src/features/auth/presentation/signup/riverpod/signup_state.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  late SignUpUseCase _signUp;
  late SignOutUseCase _signOut;
  late CreateUserAccountUseCase _createUserAccount;
  late SendVerificationEmailUseCase _sendVerificationEmail;

  @override
  SignupState build() {
    _signUp = injector();
    _sendVerificationEmail = injector();
    _signOut = injector();
    _createUserAccount = injector();
    return const SignupState();
  }

  void signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    state = state.copyWith(loadState: const Loading());
    final response = await _signUp(SignUpParams(
      email: email,
      password: password,
      userName: userName,
    ));

    response.fold(
      (failure) {
        state = state.copyWith(
          loadState: Error(message: failure.message),
        );
      },
      // (user) async => sendVerificationEmail(),
      (user) async => _handleUserAccountCreation(user.uid, email, userName),
    );
  }

  Future<void> _handleUserAccountCreation(
    String userId,
    String email,
    String userName,
  ) async {
    final accountCreationResult = await _createUserAccount(
      CreateUserAccountParam(userId: userId, email: email, userName: userName),
    );

    accountCreationResult.fold(
      (failure) {
        state = state.copyWith(
          loadState: Error(message: failure.message),
        );
        signOut();
      },
      (_) async {
        await _sendVerificationEmail(NoParams());
        await signOut();
      },
    );
  }

  void sendVerificationEmail() async {
    final result = await _sendVerificationEmail(NoParams());

    result.fold(
      (failure) async {
        state = state.copyWith(
          loadState: Error(message: failure.message),
        );
        await signOut();
      },
      (success) async => signOut(),
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
      (_) {
        state = state.copyWith(loadState: const Loaded());
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

  void vaidateUserName(String userName) {
    state = state.copyWith(isFullNameFilled: userName.isNotEmpty);
  }
}
