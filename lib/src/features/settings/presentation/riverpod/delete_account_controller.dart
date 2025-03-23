import 'package:buzzwire/core/error/error_text.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/delete_user_account_usecase.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_usecase.dart';
import 'package:buzzwire/src/features/settings/presentation/riverpod/delete_account_state.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_account_controller.g.dart';

@riverpod
class DeleteAccountController extends _$DeleteAccountController {
  late DeleteUserAccountUseCase _deleteUserAccountUseCase;
  late GetCachedUserUseCase _getCachedUserUseCase;

  @override
  DeleteAccountState build() {
    _deleteUserAccountUseCase = injector();
    _getCachedUserUseCase = injector();
    final user = _getCachedUserUseCase(NoParams());
    return DeleteAccountState(user: user.getOrElse((l) => null));
  }

  void deleteUserAccount(String password) async {
    state = state.copyWith(loadState: const Loading());
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
      },
    );
  }

  void validatePassword(String password) {
    final isPasswordValid = password.isValidPassword();
    state = state.copyWith(isPasswordValid: isPasswordValid);
  }
}
