import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/signout_usecase.dart';
import 'package:buzzwire/src/features/auth/presentation/auth_controller.dart';
import 'package:buzzwire/src/features/auth/presentation/auth_state.dart';
import 'package:buzzwire/src/features/notification/domain/usecases/delete_device_token_usecase.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_usecase.dart';
import 'package:buzzwire/src/features/settings/presentation/riverpod/settings_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_controller.g.dart';

@riverpod
class SettingsController extends _$SettingsController {
  late SignOutUseCase _signOutUseCase;
  late GetCachedUserUseCase _getCachedUserUseCase;
  late DeleteDeviceTokenUsecase _deleteDeviceTokenUsecase;

  @override
  SettingsState build() {
    _signOutUseCase = injector();
    _getCachedUserUseCase = injector();
    _deleteDeviceTokenUsecase = injector();
    return const SettingsState();
  }

  Future<void> signOut() async {
    final userResult = _getCachedUserUseCase(NoParams());
    final user = userResult.getOrElse((l) => null);

    if (user != null) {
      await _deleteDeviceTokenUsecase(user.userId);
    }
    await _signOutUseCase(NoParams());
    ref
        .read(authControllerProvider.notifier)
        .setAuthState(AuthStatus.unAuthenticated);
  }
}
