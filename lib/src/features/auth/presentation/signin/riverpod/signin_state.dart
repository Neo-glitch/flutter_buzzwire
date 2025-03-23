import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_state.freezed.dart';

@freezed
class SigninState with _$SigninState {
  const factory SigninState({
    @Default(Empty()) LoadState loadState,
    @Default(false) bool isEmailValid,
    @Default(false) bool isPasswordValid,
  }) = _SigninState;
}
