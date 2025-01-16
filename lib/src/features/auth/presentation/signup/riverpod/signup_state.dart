import 'package:buzzwire/src/features/notification/domain/entity/topic_entity.dart';
import 'package:buzzwire/src/shared/domain/entity/country_entity.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState({
    @Default(Empty()) LoadState loadState,
    @Default(false) bool isEmailValid,
    @Default(false) bool isPasswordValid,
    @Default(false) bool isUserNameFilled,
    CountryEntity? country,
  }) = _SignupState;
}
