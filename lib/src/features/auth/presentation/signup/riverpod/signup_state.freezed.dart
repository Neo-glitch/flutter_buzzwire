// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignupState {
  bool get isEmailValid => throw _privateConstructorUsedError;
  bool get isPasswordValid => throw _privateConstructorUsedError;
  bool get isFullNameFilled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupStateCopyWith<SignupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupStateCopyWith<$Res> {
  factory $SignupStateCopyWith(
          SignupState value, $Res Function(SignupState) then) =
      _$SignupStateCopyWithImpl<$Res, SignupState>;
  @useResult
  $Res call({bool isEmailValid, bool isPasswordValid, bool isFullNameFilled});
}

/// @nodoc
class _$SignupStateCopyWithImpl<$Res, $Val extends SignupState>
    implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmailValid = null,
    Object? isPasswordValid = null,
    Object? isFullNameFilled = null,
  }) {
    return _then(_value.copyWith(
      isEmailValid: null == isEmailValid
          ? _value.isEmailValid
          : isEmailValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isPasswordValid: null == isPasswordValid
          ? _value.isPasswordValid
          : isPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isFullNameFilled: null == isFullNameFilled
          ? _value.isFullNameFilled
          : isFullNameFilled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignupStateImplCopyWith<$Res>
    implements $SignupStateCopyWith<$Res> {
  factory _$$SignupStateImplCopyWith(
          _$SignupStateImpl value, $Res Function(_$SignupStateImpl) then) =
      __$$SignupStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isEmailValid, bool isPasswordValid, bool isFullNameFilled});
}

/// @nodoc
class __$$SignupStateImplCopyWithImpl<$Res>
    extends _$SignupStateCopyWithImpl<$Res, _$SignupStateImpl>
    implements _$$SignupStateImplCopyWith<$Res> {
  __$$SignupStateImplCopyWithImpl(
      _$SignupStateImpl _value, $Res Function(_$SignupStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmailValid = null,
    Object? isPasswordValid = null,
    Object? isFullNameFilled = null,
  }) {
    return _then(_$SignupStateImpl(
      isEmailValid: null == isEmailValid
          ? _value.isEmailValid
          : isEmailValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isPasswordValid: null == isPasswordValid
          ? _value.isPasswordValid
          : isPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isFullNameFilled: null == isFullNameFilled
          ? _value.isFullNameFilled
          : isFullNameFilled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SignupStateImpl implements _SignupState {
  const _$SignupStateImpl(
      {this.isEmailValid = false,
      this.isPasswordValid = false,
      this.isFullNameFilled = false});

  @override
  @JsonKey()
  final bool isEmailValid;
  @override
  @JsonKey()
  final bool isPasswordValid;
  @override
  @JsonKey()
  final bool isFullNameFilled;

  @override
  String toString() {
    return 'SignupState(isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isFullNameFilled: $isFullNameFilled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupStateImpl &&
            (identical(other.isEmailValid, isEmailValid) ||
                other.isEmailValid == isEmailValid) &&
            (identical(other.isPasswordValid, isPasswordValid) ||
                other.isPasswordValid == isPasswordValid) &&
            (identical(other.isFullNameFilled, isFullNameFilled) ||
                other.isFullNameFilled == isFullNameFilled));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isEmailValid, isPasswordValid, isFullNameFilled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupStateImplCopyWith<_$SignupStateImpl> get copyWith =>
      __$$SignupStateImplCopyWithImpl<_$SignupStateImpl>(this, _$identity);
}

abstract class _SignupState implements SignupState {
  const factory _SignupState(
      {final bool isEmailValid,
      final bool isPasswordValid,
      final bool isFullNameFilled}) = _$SignupStateImpl;

  @override
  bool get isEmailValid;
  @override
  bool get isPasswordValid;
  @override
  bool get isFullNameFilled;
  @override
  @JsonKey(ignore: true)
  _$$SignupStateImplCopyWith<_$SignupStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
