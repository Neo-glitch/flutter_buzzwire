import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus authStatus,
    @Default(false) bool isLoading,
    @Default(null) String? errorMessage,
  }) = _AuthState;
}

enum AuthStatus {
  initial,
  authenticated,
  unAuthenticated,
}
