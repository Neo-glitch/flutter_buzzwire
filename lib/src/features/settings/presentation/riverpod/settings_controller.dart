import 'package:buzzwire/core/error/error_text.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/delete_user_account_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/signout_usecase.dart';
import 'package:buzzwire/src/features/auth/presentation/auth_controller.dart';
import 'package:buzzwire/src/features/auth/presentation/auth_state.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_usecase.dart';
import 'package:buzzwire/src/features/settings/presentation/riverpod/settings_state.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_controller.g.dart';

@riverpod
class SettingsController extends _$SettingsController {
  late SignOutUseCase _signOutUseCase;
  late DeleteUserAccountUseCase _deleteUserAccountUseCase;
  late GetCachedUserUseCase _getCachedUserUseCase;
  @override
  SettingsState build() {
    _signOutUseCase = injector();
    _deleteUserAccountUseCase = injector();
    _getCachedUserUseCase = injector();
    return const SettingsState();
  }

  Future<void> signOut() async {
    await _signOutUseCase(NoParams());
    ref
        .read(authControllerProvider.notifier)
        .setAuthState(AuthStatus.unAuthenticated);
  }

  Future<void> deleteUserAccount(String password) async {
    final userResult = _getCachedUserUseCase(NoParams());
    final user = userResult.getOrElse((l) => null);

    if (user == null) {
      state = state.copyWith(
          loadState: const Error(message: ErrorText.unknownError));
      return;
    }
    final deleteAccountResult = await _deleteUserAccountUseCase(
      DeleteUserAccountParam(userEntity: user, password: password),
    );

    deleteAccountResult.fold(
      (failure) =>
          state = state.copyWith(loadState: Error(message: failure.message)),
      (result) {
        state = state.copyWith(loadState: const Loaded());
        ref
            .read(authControllerProvider.notifier)
            .setAuthState(AuthStatus.unAuthenticated);
      },
    );
  }
}
