// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CountryEntity {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountryEntityCopyWith<CountryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryEntityCopyWith<$Res> {
  factory $CountryEntityCopyWith(
          CountryEntity value, $Res Function(CountryEntity) then) =
      _$CountryEntityCopyWithImpl<$Res, CountryEntity>;
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class _$CountryEntityCopyWithImpl<$Res, $Val extends CountryEntity>
    implements $CountryEntityCopyWith<$Res> {
  _$CountryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryEntityImplCopyWith<$Res>
    implements $CountryEntityCopyWith<$Res> {
  factory _$$CountryEntityImplCopyWith(
          _$CountryEntityImpl value, $Res Function(_$CountryEntityImpl) then) =
      __$$CountryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$CountryEntityImplCopyWithImpl<$Res>
    extends _$CountryEntityCopyWithImpl<$Res, _$CountryEntityImpl>
    implements _$$CountryEntityImplCopyWith<$Res> {
  __$$CountryEntityImplCopyWithImpl(
      _$CountryEntityImpl _value, $Res Function(_$CountryEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$CountryEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CountryEntityImpl extends _CountryEntity {
  const _$CountryEntityImpl({required this.name, required this.code})
      : super._();

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'CountryEntity(name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryEntityImplCopyWith<_$CountryEntityImpl> get copyWith =>
      __$$CountryEntityImplCopyWithImpl<_$CountryEntityImpl>(this, _$identity);
}

abstract class _CountryEntity extends CountryEntity {
  const factory _CountryEntity(
      {required final String name,
      required final String code}) = _$CountryEntityImpl;
  const _CountryEntity._() : super._();

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$CountryEntityImplCopyWith<_$CountryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
