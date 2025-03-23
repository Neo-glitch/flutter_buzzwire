import 'package:buzzwire/src/shared/domain/entity/user_entity.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
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
