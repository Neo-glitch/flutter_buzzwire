import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_state.freezed.dart';

@freezed
class SigninState with _$SigninState {
  const factory SigninState({
    @Default(false) bool isEmailValid,
    @Default(false) bool isPasswordValid,
  }) = _SigninState;
}
