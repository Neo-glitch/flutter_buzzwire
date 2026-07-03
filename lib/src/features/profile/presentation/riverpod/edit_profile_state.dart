import 'dart:io';

import 'package:buzzwire/core/domain/entity/country_entity.dart';
import 'package:buzzwire/core/domain/entity/user_entity.dart';
import 'package:buzzwire/core/ui/model/load_state.dart';
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
