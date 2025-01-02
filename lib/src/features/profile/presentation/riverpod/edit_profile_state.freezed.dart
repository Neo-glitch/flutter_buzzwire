// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditProfileState {
  UserEntity? get user => throw _privateConstructorUsedError;
  File? get newImage => throw _privateConstructorUsedError;
  LoadState get loadState => throw _privateConstructorUsedError;
  bool get canResubmitUsername => throw _privateConstructorUsedError;
  bool get canResubmitPhone => throw _privateConstructorUsedError;
  bool get canResubmitCountry => throw _privateConstructorUsedError;
  bool get isUpdateCompleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProfileStateCopyWith<EditProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileStateCopyWith<$Res> {
  factory $EditProfileStateCopyWith(
          EditProfileState value, $Res Function(EditProfileState) then) =
      _$EditProfileStateCopyWithImpl<$Res, EditProfileState>;
  @useResult
  $Res call(
      {UserEntity? user,
      File? newImage,
      LoadState loadState,
      bool canResubmitUsername,
      bool canResubmitPhone,
      bool canResubmitCountry,
      bool isUpdateCompleted});

  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class _$EditProfileStateCopyWithImpl<$Res, $Val extends EditProfileState>
    implements $EditProfileStateCopyWith<$Res> {
  _$EditProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? newImage = freezed,
    Object? loadState = null,
    Object? canResubmitUsername = null,
    Object? canResubmitPhone = null,
    Object? canResubmitCountry = null,
    Object? isUpdateCompleted = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      newImage: freezed == newImage
          ? _value.newImage
          : newImage // ignore: cast_nullable_to_non_nullable
              as File?,
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
      canResubmitUsername: null == canResubmitUsername
          ? _value.canResubmitUsername
          : canResubmitUsername // ignore: cast_nullable_to_non_nullable
              as bool,
      canResubmitPhone: null == canResubmitPhone
          ? _value.canResubmitPhone
          : canResubmitPhone // ignore: cast_nullable_to_non_nullable
              as bool,
      canResubmitCountry: null == canResubmitCountry
          ? _value.canResubmitCountry
          : canResubmitCountry // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateCompleted: null == isUpdateCompleted
          ? _value.isUpdateCompleted
          : isUpdateCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EditProfileStateImplCopyWith<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  factory _$$EditProfileStateImplCopyWith(_$EditProfileStateImpl value,
          $Res Function(_$EditProfileStateImpl) then) =
      __$$EditProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserEntity? user,
      File? newImage,
      LoadState loadState,
      bool canResubmitUsername,
      bool canResubmitPhone,
      bool canResubmitCountry,
      bool isUpdateCompleted});

  @override
  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class __$$EditProfileStateImplCopyWithImpl<$Res>
    extends _$EditProfileStateCopyWithImpl<$Res, _$EditProfileStateImpl>
    implements _$$EditProfileStateImplCopyWith<$Res> {
  __$$EditProfileStateImplCopyWithImpl(_$EditProfileStateImpl _value,
      $Res Function(_$EditProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? newImage = freezed,
    Object? loadState = null,
    Object? canResubmitUsername = null,
    Object? canResubmitPhone = null,
    Object? canResubmitCountry = null,
    Object? isUpdateCompleted = null,
  }) {
    return _then(_$EditProfileStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      newImage: freezed == newImage
          ? _value.newImage
          : newImage // ignore: cast_nullable_to_non_nullable
              as File?,
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
      canResubmitUsername: null == canResubmitUsername
          ? _value.canResubmitUsername
          : canResubmitUsername // ignore: cast_nullable_to_non_nullable
              as bool,
      canResubmitPhone: null == canResubmitPhone
          ? _value.canResubmitPhone
          : canResubmitPhone // ignore: cast_nullable_to_non_nullable
              as bool,
      canResubmitCountry: null == canResubmitCountry
          ? _value.canResubmitCountry
          : canResubmitCountry // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateCompleted: null == isUpdateCompleted
          ? _value.isUpdateCompleted
          : isUpdateCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EditProfileStateImpl implements _EditProfileState {
  const _$EditProfileStateImpl(
      {this.user,
      this.newImage,
      this.loadState = const Empty(),
      this.canResubmitUsername = false,
      this.canResubmitPhone = false,
      this.canResubmitCountry = false,
      this.isUpdateCompleted = false});

  @override
  final UserEntity? user;
  @override
  final File? newImage;
  @override
  @JsonKey()
  final LoadState loadState;
  @override
  @JsonKey()
  final bool canResubmitUsername;
  @override
  @JsonKey()
  final bool canResubmitPhone;
  @override
  @JsonKey()
  final bool canResubmitCountry;
  @override
  @JsonKey()
  final bool isUpdateCompleted;

  @override
  String toString() {
    return 'EditProfileState(user: $user, newImage: $newImage, loadState: $loadState, canResubmitUsername: $canResubmitUsername, canResubmitPhone: $canResubmitPhone, canResubmitCountry: $canResubmitCountry, isUpdateCompleted: $isUpdateCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProfileStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.newImage, newImage) ||
                other.newImage == newImage) &&
            (identical(other.loadState, loadState) ||
                other.loadState == loadState) &&
            (identical(other.canResubmitUsername, canResubmitUsername) ||
                other.canResubmitUsername == canResubmitUsername) &&
            (identical(other.canResubmitPhone, canResubmitPhone) ||
                other.canResubmitPhone == canResubmitPhone) &&
            (identical(other.canResubmitCountry, canResubmitCountry) ||
                other.canResubmitCountry == canResubmitCountry) &&
            (identical(other.isUpdateCompleted, isUpdateCompleted) ||
                other.isUpdateCompleted == isUpdateCompleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      newImage,
      loadState,
      canResubmitUsername,
      canResubmitPhone,
      canResubmitCountry,
      isUpdateCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProfileStateImplCopyWith<_$EditProfileStateImpl> get copyWith =>
      __$$EditProfileStateImplCopyWithImpl<_$EditProfileStateImpl>(
          this, _$identity);
}

abstract class _EditProfileState implements EditProfileState {
  const factory _EditProfileState(
      {final UserEntity? user,
      final File? newImage,
      final LoadState loadState,
      final bool canResubmitUsername,
      final bool canResubmitPhone,
      final bool canResubmitCountry,
      final bool isUpdateCompleted}) = _$EditProfileStateImpl;

  @override
  UserEntity? get user;
  @override
  File? get newImage;
  @override
  LoadState get loadState;
  @override
  bool get canResubmitUsername;
  @override
  bool get canResubmitPhone;
  @override
  bool get canResubmitCountry;
  @override
  bool get isUpdateCompleted;
  @override
  @JsonKey(ignore: true)
  _$$EditProfileStateImplCopyWith<_$EditProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
