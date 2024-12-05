import 'package:buzzwire/core/common/riverpod/load_state.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/core/utils/extensions/string_extensions.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/send_verification_email_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/signout_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/signup_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/verify_email_usecase.dart';
import 'package:buzzwire/src/features/auth/presentation/signup/riverpod/signup_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  late SignUp _signUp;
  late SignOut _signOut;
  late SendVerificationEmail _sendVerificationEmail;

  @override
  SignupState build() {
    _signUp = ref.read(signUpProvider);
    _sendVerificationEmail = ref.read(sendVerificationEmailProvider);
    _signOut = ref.read(signOutProvider);
    return SignupState();
  }

  void signUp({required String email, required String password}) async {
    state = state.copyWith(loadState: Loading());
    final result =
        await _signUp(SignUpParams(email: email, password: password));

    result.fold(
      (failure) {
        state = state.copyWith(
          loadState: Error(message: failure.message),
        );
      },
      (user) async => sendVerificationEmail(),
    );
  }

  void sendVerificationEmail() async {
    final result = await _sendVerificationEmail(NoParams());

    result.fold(
      (failure) {
        state = state.copyWith(
          loadState: Error(message: failure.message),
        );
        signOut();
      },
      (success) async => signOut(),
    );
  }

  void signOut() async {
    final result = await _signOut(NoParams());

    result.fold(
      (failure) {
        state = state.copyWith(
          loadState: Error(message: failure.message),
        );
      },
      (_) {
        state = state.copyWith(loadState: Loaded());
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

  void hasSeenError() {
    state = state.copyWith(loadState: const Empty());
  }
}
