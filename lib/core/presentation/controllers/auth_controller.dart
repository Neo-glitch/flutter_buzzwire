import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/core/ui/model/auth_status.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  late GetCachedUserUseCase _getCachedUserUseCase;

  @override
  AuthStatus build() {
    _getCachedUserUseCase = injector();
    final user = _getCachedUserUseCase(NoParams()).getOrElse((l) => null);
    return user != null ? AuthStatus.authenticated : AuthStatus.unAuthenticated;
  }

  void setAuthStatus(AuthStatus status) => state = status;
}
