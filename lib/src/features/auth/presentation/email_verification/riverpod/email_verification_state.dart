import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_verification_state.freezed.dart';

@freezed
class EmailVerificationState with _$EmailVerificationState {
  const factory EmailVerificationState(
      {@Default(Empty()) LoadState loadState,
      @Default(false) bool isEmailValid,
      @Default(false) bool isPasswordValid}) = _EmailVerificationState;
}
