// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChangePasswordState {
  LoadState get loadState => throw _privateConstructorUsedError;
  bool get isOldPasswordValid => throw _privateConstructorUsedError;
  bool get isNewPasswordValid => throw _privateConstructorUsedError;
  bool get isConfirmPasswordValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChangePasswordStateCopyWith<ChangePasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordStateCopyWith<$Res> {
  factory $ChangePasswordStateCopyWith(
          ChangePasswordState value, $Res Function(ChangePasswordState) then) =
      _$ChangePasswordStateCopyWithImpl<$Res, ChangePasswordState>;
  @useResult
  $Res call(
      {LoadState loadState,
      bool isOldPasswordValid,
      bool isNewPasswordValid,
      bool isConfirmPasswordValid});
}

/// @nodoc
class _$ChangePasswordStateCopyWithImpl<$Res, $Val extends ChangePasswordState>
    implements $ChangePasswordStateCopyWith<$Res> {
  _$ChangePasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadState = null,
    Object? isOldPasswordValid = null,
    Object? isNewPasswordValid = null,
    Object? isConfirmPasswordValid = null,
  }) {
    return _then(_value.copyWith(
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
      isOldPasswordValid: null == isOldPasswordValid
          ? _value.isOldPasswordValid
          : isOldPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isNewPasswordValid: null == isNewPasswordValid
          ? _value.isNewPasswordValid
          : isNewPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordValid: null == isConfirmPasswordValid
          ? _value.isConfirmPasswordValid
          : isConfirmPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePasswordStateImplCopyWith<$Res>
    implements $ChangePasswordStateCopyWith<$Res> {
  factory _$$ChangePasswordStateImplCopyWith(_$ChangePasswordStateImpl value,
          $Res Function(_$ChangePasswordStateImpl) then) =
      __$$ChangePasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadState loadState,
      bool isOldPasswordValid,
      bool isNewPasswordValid,
      bool isConfirmPasswordValid});
}

/// @nodoc
class __$$ChangePasswordStateImplCopyWithImpl<$Res>
    extends _$ChangePasswordStateCopyWithImpl<$Res, _$ChangePasswordStateImpl>
    implements _$$ChangePasswordStateImplCopyWith<$Res> {
  __$$ChangePasswordStateImplCopyWithImpl(_$ChangePasswordStateImpl _value,
      $Res Function(_$ChangePasswordStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadState = null,
    Object? isOldPasswordValid = null,
    Object? isNewPasswordValid = null,
    Object? isConfirmPasswordValid = null,
  }) {
    return _then(_$ChangePasswordStateImpl(
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
      isOldPasswordValid: null == isOldPasswordValid
          ? _value.isOldPasswordValid
          : isOldPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isNewPasswordValid: null == isNewPasswordValid
          ? _value.isNewPasswordValid
          : isNewPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordValid: null == isConfirmPasswordValid
          ? _value.isConfirmPasswordValid
          : isConfirmPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChangePasswordStateImpl implements _ChangePasswordState {
  const _$ChangePasswordStateImpl(
      {this.loadState = const Empty(),
      this.isOldPasswordValid = false,
      this.isNewPasswordValid = false,
      this.isConfirmPasswordValid = false});

  @override
  @JsonKey()
  final LoadState loadState;
  @override
  @JsonKey()
  final bool isOldPasswordValid;
  @override
  @JsonKey()
  final bool isNewPasswordValid;
  @override
  @JsonKey()
  final bool isConfirmPasswordValid;

  @override
  String toString() {
    return 'ChangePasswordState(loadState: $loadState, isOldPasswordValid: $isOldPasswordValid, isNewPasswordValid: $isNewPasswordValid, isConfirmPasswordValid: $isConfirmPasswordValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordStateImpl &&
            (identical(other.loadState, loadState) ||
                other.loadState == loadState) &&
            (identical(other.isOldPasswordValid, isOldPasswordValid) ||
                other.isOldPasswordValid == isOldPasswordValid) &&
            (identical(other.isNewPasswordValid, isNewPasswordValid) ||
                other.isNewPasswordValid == isNewPasswordValid) &&
            (identical(other.isConfirmPasswordValid, isConfirmPasswordValid) ||
                other.isConfirmPasswordValid == isConfirmPasswordValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadState, isOldPasswordValid,
      isNewPasswordValid, isConfirmPasswordValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordStateImplCopyWith<_$ChangePasswordStateImpl> get copyWith =>
      __$$ChangePasswordStateImplCopyWithImpl<_$ChangePasswordStateImpl>(
          this, _$identity);
}

abstract class _ChangePasswordState implements ChangePasswordState {
  const factory _ChangePasswordState(
      {final LoadState loadState,
      final bool isOldPasswordValid,
      final bool isNewPasswordValid,
      final bool isConfirmPasswordValid}) = _$ChangePasswordStateImpl;

  @override
  LoadState get loadState;
  @override
  bool get isOldPasswordValid;
  @override
  bool get isNewPasswordValid;
  @override
  bool get isConfirmPasswordValid;
  @override
  @JsonKey(ignore: true)
  _$$ChangePasswordStateImplCopyWith<_$ChangePasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
