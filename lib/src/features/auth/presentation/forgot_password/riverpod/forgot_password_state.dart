import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_state.freezed.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default(Empty()) LoadState loadState,
    @Default(false) bool isEmailValid,
  }) = _ForgotPasswordState;
}
