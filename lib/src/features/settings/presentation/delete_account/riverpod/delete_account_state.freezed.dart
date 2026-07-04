// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeleteAccountState {
  UserEntity? get user => throw _privateConstructorUsedError;
  bool get isPasswordValid => throw _privateConstructorUsedError;
  LoadState get loadState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeleteAccountStateCopyWith<DeleteAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteAccountStateCopyWith<$Res> {
  factory $DeleteAccountStateCopyWith(
          DeleteAccountState value, $Res Function(DeleteAccountState) then) =
      _$DeleteAccountStateCopyWithImpl<$Res, DeleteAccountState>;
  @useResult
  $Res call({UserEntity? user, bool isPasswordValid, LoadState loadState});
}

/// @nodoc
class _$DeleteAccountStateCopyWithImpl<$Res, $Val extends DeleteAccountState>
    implements $DeleteAccountStateCopyWith<$Res> {
  _$DeleteAccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? isPasswordValid = null,
    Object? loadState = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      isPasswordValid: null == isPasswordValid
          ? _value.isPasswordValid
          : isPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool,
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteAccountStateImplCopyWith<$Res>
    implements $DeleteAccountStateCopyWith<$Res> {
  factory _$$DeleteAccountStateImplCopyWith(_$DeleteAccountStateImpl value,
          $Res Function(_$DeleteAccountStateImpl) then) =
      __$$DeleteAccountStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserEntity? user, bool isPasswordValid, LoadState loadState});
}

/// @nodoc
class __$$DeleteAccountStateImplCopyWithImpl<$Res>
    extends _$DeleteAccountStateCopyWithImpl<$Res, _$DeleteAccountStateImpl>
    implements _$$DeleteAccountStateImplCopyWith<$Res> {
  __$$DeleteAccountStateImplCopyWithImpl(_$DeleteAccountStateImpl _value,
      $Res Function(_$DeleteAccountStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? isPasswordValid = null,
    Object? loadState = null,
  }) {
    return _then(_$DeleteAccountStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      isPasswordValid: null == isPasswordValid
          ? _value.isPasswordValid
          : isPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool,
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
    ));
  }
}

/// @nodoc

class _$DeleteAccountStateImpl implements _DeleteAccountState {
  const _$DeleteAccountStateImpl(
      {this.user,
      this.isPasswordValid = false,
      this.loadState = const Empty()});

  @override
  final UserEntity? user;
  @override
  @JsonKey()
  final bool isPasswordValid;
  @override
  @JsonKey()
  final LoadState loadState;

  @override
  String toString() {
    return 'DeleteAccountState(user: $user, isPasswordValid: $isPasswordValid, loadState: $loadState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAccountStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isPasswordValid, isPasswordValid) ||
                other.isPasswordValid == isPasswordValid) &&
            (identical(other.loadState, loadState) ||
                other.loadState == loadState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, user, isPasswordValid, loadState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteAccountStateImplCopyWith<_$DeleteAccountStateImpl> get copyWith =>
      __$$DeleteAccountStateImplCopyWithImpl<_$DeleteAccountStateImpl>(
          this, _$identity);
}

abstract class _DeleteAccountState implements DeleteAccountState {
  const factory _DeleteAccountState(
      {final UserEntity? user,
      final bool isPasswordValid,
      final LoadState loadState}) = _$DeleteAccountStateImpl;

  @override
  UserEntity? get user;
  @override
  bool get isPasswordValid;
  @override
  LoadState get loadState;
  @override
  @JsonKey(ignore: true)
  _$$DeleteAccountStateImplCopyWith<_$DeleteAccountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
