import 'package:buzzwire/core/common/riverpod/load_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState({
    @Default(Empty()) LoadState loadState,
    @Default(false) bool isEmailValid,
    @Default(false) bool isPasswordValid,
    @Default(false) bool isFullNameFilled,
  }) = _SignupState;
}
