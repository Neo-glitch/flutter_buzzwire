import 'dart:io';

import 'package:buzzwire/src/shared/domain/entity/country_entity.dart';
import 'package:buzzwire/src/shared/domain/entity/user_entity.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_state.freezed.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    UserEntity? user,
    File? newImage,
    CountryEntity? newCountry,
    @Default(Empty()) LoadState loadState,
    @Default(false) bool canResubmitUsername,
    @Default(false) bool canResubmitPhone,
    @Default(false) bool canResubmitCountry,
  }) = _EditProfileState;
}
