import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState({
    @Default(false) bool isEmailValid,
    @Default(false) bool isPasswordValid,
    @Default(false) bool isFullNameFilled,
  }) = _SignupState;
}
