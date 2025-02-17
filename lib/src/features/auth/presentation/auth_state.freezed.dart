// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  AuthStatus get authStatus => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isSignInEmailUnverified => throw _privateConstructorUsedError;
  bool get isEmailVerificationMailSent => throw _privateConstructorUsedError;
  bool get isPasswordResetMailSent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {AuthStatus authStatus,
      bool isLoading,
      String? errorMessage,
      bool isSignInEmailUnverified,
      bool isEmailVerificationMailSent,
      bool isPasswordResetMailSent});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authStatus = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? isSignInEmailUnverified = null,
    Object? isEmailVerificationMailSent = null,
    Object? isPasswordResetMailSent = null,
  }) {
    return _then(_value.copyWith(
      authStatus: null == authStatus
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSignInEmailUnverified: null == isSignInEmailUnverified
          ? _value.isSignInEmailUnverified
          : isSignInEmailUnverified // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmailVerificationMailSent: null == isEmailVerificationMailSent
          ? _value.isEmailVerificationMailSent
          : isEmailVerificationMailSent // ignore: cast_nullable_to_non_nullable
              as bool,
      isPasswordResetMailSent: null == isPasswordResetMailSent
          ? _value.isPasswordResetMailSent
          : isPasswordResetMailSent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthStatus authStatus,
      bool isLoading,
      String? errorMessage,
      bool isSignInEmailUnverified,
      bool isEmailVerificationMailSent,
      bool isPasswordResetMailSent});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authStatus = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? isSignInEmailUnverified = null,
    Object? isEmailVerificationMailSent = null,
    Object? isPasswordResetMailSent = null,
  }) {
    return _then(_$AuthStateImpl(
      authStatus: null == authStatus
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSignInEmailUnverified: null == isSignInEmailUnverified
          ? _value.isSignInEmailUnverified
          : isSignInEmailUnverified // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmailVerificationMailSent: null == isEmailVerificationMailSent
          ? _value.isEmailVerificationMailSent
          : isEmailVerificationMailSent // ignore: cast_nullable_to_non_nullable
              as bool,
      isPasswordResetMailSent: null == isPasswordResetMailSent
          ? _value.isPasswordResetMailSent
          : isPasswordResetMailSent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl with DiagnosticableTreeMixin implements _AuthState {
  const _$AuthStateImpl(
      {this.authStatus = AuthStatus.initial,
      this.isLoading = false,
      this.errorMessage = null,
      this.isSignInEmailUnverified = false,
      this.isEmailVerificationMailSent = false,
      this.isPasswordResetMailSent = false});

  @override
  @JsonKey()
  final AuthStatus authStatus;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String? errorMessage;
  @override
  @JsonKey()
  final bool isSignInEmailUnverified;
  @override
  @JsonKey()
  final bool isEmailVerificationMailSent;
  @override
  @JsonKey()
  final bool isPasswordResetMailSent;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState(authStatus: $authStatus, isLoading: $isLoading, errorMessage: $errorMessage, isSignInEmailUnverified: $isSignInEmailUnverified, isEmailVerificationMailSent: $isEmailVerificationMailSent, isPasswordResetMailSent: $isPasswordResetMailSent)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState'))
      ..add(DiagnosticsProperty('authStatus', authStatus))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('errorMessage', errorMessage))
      ..add(DiagnosticsProperty(
          'isSignInEmailUnverified', isSignInEmailUnverified))
      ..add(DiagnosticsProperty(
          'isEmailVerificationMailSent', isEmailVerificationMailSent))
      ..add(DiagnosticsProperty(
          'isPasswordResetMailSent', isPasswordResetMailSent));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.authStatus, authStatus) ||
                other.authStatus == authStatus) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(
                    other.isSignInEmailUnverified, isSignInEmailUnverified) ||
                other.isSignInEmailUnverified == isSignInEmailUnverified) &&
            (identical(other.isEmailVerificationMailSent,
                    isEmailVerificationMailSent) ||
                other.isEmailVerificationMailSent ==
                    isEmailVerificationMailSent) &&
            (identical(
                    other.isPasswordResetMailSent, isPasswordResetMailSent) ||
                other.isPasswordResetMailSent == isPasswordResetMailSent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      authStatus,
      isLoading,
      errorMessage,
      isSignInEmailUnverified,
      isEmailVerificationMailSent,
      isPasswordResetMailSent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {final AuthStatus authStatus,
      final bool isLoading,
      final String? errorMessage,
      final bool isSignInEmailUnverified,
      final bool isEmailVerificationMailSent,
      final bool isPasswordResetMailSent}) = _$AuthStateImpl;

  @override
  AuthStatus get authStatus;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  bool get isSignInEmailUnverified;
  @override
  bool get isEmailVerificationMailSent;
  @override
  bool get isPasswordResetMailSent;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
