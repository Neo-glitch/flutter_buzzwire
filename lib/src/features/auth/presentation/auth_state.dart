import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus authStatus,
    @Default(false) bool isLoading,
    @Default(null) String? errorMessage,
    @Default(false) bool isSignInEmailUnverified,
    @Default(false) bool isEmailVerificationMailSent,
    @Default(false) bool isPasswordResetMailSent,
  }) = _AuthState;
}

enum AuthStatus {
  initial,
  registered,
  registeredAndVerified,
  authenticated,
  unAuthenticated,
}
