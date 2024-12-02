// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SigninState {
  bool get isEmailValid => throw _privateConstructorUsedError;
  bool get isPasswordValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SigninStateCopyWith<SigninState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SigninStateCopyWith<$Res> {
  factory $SigninStateCopyWith(
          SigninState value, $Res Function(SigninState) then) =
      _$SigninStateCopyWithImpl<$Res, SigninState>;
  @useResult
  $Res call({bool isEmailValid, bool isPasswordValid});
}

/// @nodoc
class _$SigninStateCopyWithImpl<$Res, $Val extends SigninState>
    implements $SigninStateCopyWith<$Res> {
  _$SigninStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmailValid = null,
    Object? isPasswordValid = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SigninStateImplCopyWith<$Res>
    implements $SigninStateCopyWith<$Res> {
  factory _$$SigninStateImplCopyWith(
          _$SigninStateImpl value, $Res Function(_$SigninStateImpl) then) =
      __$$SigninStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isEmailValid, bool isPasswordValid});
}

/// @nodoc
class __$$SigninStateImplCopyWithImpl<$Res>
    extends _$SigninStateCopyWithImpl<$Res, _$SigninStateImpl>
    implements _$$SigninStateImplCopyWith<$Res> {
  __$$SigninStateImplCopyWithImpl(
      _$SigninStateImpl _value, $Res Function(_$SigninStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmailValid = null,
    Object? isPasswordValid = null,
  }) {
    return _then(_$SigninStateImpl(
      isEmailValid: null == isEmailValid
          ? _value.isEmailValid
          : isEmailValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isPasswordValid: null == isPasswordValid
          ? _value.isPasswordValid
          : isPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SigninStateImpl implements _SigninState {
  const _$SigninStateImpl(
      {this.isEmailValid = false, this.isPasswordValid = false});

  @override
  @JsonKey()
  final bool isEmailValid;
  @override
  @JsonKey()
  final bool isPasswordValid;

  @override
  String toString() {
    return 'SigninState(isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigninStateImpl &&
            (identical(other.isEmailValid, isEmailValid) ||
                other.isEmailValid == isEmailValid) &&
            (identical(other.isPasswordValid, isPasswordValid) ||
                other.isPasswordValid == isPasswordValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEmailValid, isPasswordValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SigninStateImplCopyWith<_$SigninStateImpl> get copyWith =>
      __$$SigninStateImplCopyWithImpl<_$SigninStateImpl>(this, _$identity);
}

abstract class _SigninState implements SigninState {
  const factory _SigninState(
      {final bool isEmailValid,
      final bool isPasswordValid}) = _$SigninStateImpl;

  @override
  bool get isEmailValid;
  @override
  bool get isPasswordValid;
  @override
  @JsonKey(ignore: true)
  _$$SigninStateImplCopyWith<_$SigninStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
