import 'package:buzzwire/src/shared/domain/entity/country_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const UserEntity._();

  const factory UserEntity({
    required String userId,
    required String email,
    required String userName,
    String? phoneNumber,
    CountryEntity? country,
    String? profileImage,
  }) = _UserEntity;
}
