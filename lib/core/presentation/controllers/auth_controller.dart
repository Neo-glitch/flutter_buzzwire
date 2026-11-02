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
  Future<AuthStatus> build() async {
    _getCachedUserUseCase = injector();
    final result = await _getCachedUserUseCase(NoParams());
    final user = result.getOrElse((l) => null);
    return user != null ? AuthStatus.authenticated : AuthStatus.unAuthenticated;
  }

  void setAuthStatus(AuthStatus status) => state = AsyncData(status);
}
