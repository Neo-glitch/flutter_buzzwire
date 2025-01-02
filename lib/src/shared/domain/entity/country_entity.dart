import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_entity.freezed.dart';

@freezed
class CountryEntity with _$CountryEntity {
  const CountryEntity._();

  const factory CountryEntity({
    required String name,
    required String code,
  }) = _CountryEntity;
}
