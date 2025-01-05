import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_state.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  late GetCachedUserUseCase _getCachedUserUseCase;

  @override
  AuthState build() {
    _getCachedUserUseCase = injector();
    final user = _getCachedUserUseCase(NoParams()).getOrElse((l) => null);
    final isAuthenticated = user != null;
    return AuthState(
      authStatus: isAuthenticated
          ? AuthStatus.authenticated
          : AuthStatus.unAuthenticated,
    );
  }

  void setAuthState(AuthStatus authStatus) {
    state = state.copyWith(authStatus: authStatus);
  }
}
