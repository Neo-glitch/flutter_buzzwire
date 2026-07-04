import 'package:buzzwire/core/ui/model/load_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_state.freezed.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    @Default(Empty()) LoadState loadState,
    @Default(false) bool isOldPasswordValid,
    @Default(false) bool isNewPasswordValid,
    @Default(false) bool isConfirmPasswordValid,
  }) = _ChangePasswordState;
}
