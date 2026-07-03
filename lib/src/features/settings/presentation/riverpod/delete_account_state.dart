import 'package:buzzwire/core/domain/entity/user_entity.dart';
import 'package:buzzwire/core/ui/model/load_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_account_state.freezed.dart';

@freezed
class DeleteAccountState with _$DeleteAccountState {
  const factory DeleteAccountState({
    UserEntity? user,
    @Default(false) bool isPasswordValid,
    @Default(Empty()) LoadState loadState,
  }) = _DeleteAccountState;
}
