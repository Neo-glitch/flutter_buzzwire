import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/src/features/auth/presentation/auth_controller.dart';
import 'package:buzzwire/src/features/auth/presentation/auth_state.dart';
import 'package:buzzwire/src/features/settings/presentation/riverpod/delete_account_controller.dart';
import 'package:buzzwire/src/features/settings/presentation/riverpod/delete_account_state.dart';
import 'package:buzzwire/src/shared/presentation/screens/operation_loading_dialog.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_profile_image.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_password_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class DeleteAccountScreen extends ConsumerStatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  ConsumerState<DeleteAccountScreen> createState() =>
      _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends ConsumerState<DeleteAccountScreen> {
  final _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordTextController.dispose();
    super.dispose();
  }

  void _listenToUiState() {
    ref.listen(
      deleteAccountControllerProvider,
      (previous, next) async {
        if (next.loadState is Error && previous?.loadState is! Error) {
          // pop loading dialog off
          context.pop();
          final message = (next.loadState as Error).message;
          context.showSingleButtonAlert(BuzzWireStrings.error, message);
          return;
        }

        if (next.loadState is Loading) {
          _showLoadingDialog();
          return;
        }

        if (next.loadState is Loaded) {
          context.pop();
          await context.showToast("Your account has been successfully deleted");
          ref
              .read(authControllerProvider.notifier)
              .setAuthState(AuthStatus.unAuthenticated);
        }
      },
    );
  }

  void _deleteUserAccount() {
    ref.read(deleteAccountControllerProvider.notifier).deleteUserAccount(
          _passwordTextController.text,
        );
  }

  void _showLoadingDialog() {
    context.showFullScreenDialog(
        dialog: const OperationLoadingDialog(
      title: BuzzWireStrings.deletingYourAccount,
    ));
  }

  @override
  Widget build(BuildContext context) {
    _listenToUiState();
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(child: _buildBody()),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return BuzzWireAppBar(
      title: Text(
        BuzzWireStrings.deleteAccount,
        style: context.titleLarge?.copyWith(fontSize: 20),
      ),
    );
  }

  Widget _buildBody() {
    final uiState = ref.watch(deleteAccountControllerProvider);
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildUserDetailsSection(uiState),
            _buildAccountDeletionInfoSection(),
            _buildPasswordInput(uiState),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: uiState.isPasswordValid
                    ? () {
                        _deleteUserAccount();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.errorColor,
                  disabledBackgroundColor: context.errorColor.withOpacity(0.4),
                ),
                child: const Text(BuzzWireStrings.deleteAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordInput(DeleteAccountState uiState) {
    return BuzzWirePasswordInputField(
      controller: _passwordTextController,
      enabled: uiState.loadState is! Loading,
      hintText: "Enter password",
      textInputAction: TextInputAction.done,
      onChanged: (value) => ref
          .read(deleteAccountControllerProvider.notifier)
          .validatePassword(value),
    );
  }

  Widget _buildUserDetailsSection(DeleteAccountState uiState) {
    return Column(
      children: [
        Center(
          child: BuzzWireProfileImage(
            radius: 40,
            imageUrl: uiState.user?.profileImage?.imageUrl.orEmpty,
          ),
        ),
        const Gap(4),
        Text(
          uiState.user?.userName.orEmpty ?? "",
          style: context.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildAccountDeletionInfoSection() {
    return Column(
      children: [
        const Gap(20),
        Text(
          textAlign: TextAlign.center,
          BuzzWireStrings.permanentlyDeleteYourAccount,
          style: context.titleSmall,
        ),
        const Gap(16),
        const Text(
          textAlign: TextAlign.center,
          BuzzWireStrings.permanentlyDeleteAccountDesc,
        ),
        const Gap(40),
      ],
    );
  }
}
