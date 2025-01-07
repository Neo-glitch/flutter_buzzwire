import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/utils/extensions/bool_extension.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/settings/presentation/riverpod/change_password_controller.dart';
import 'package:buzzwire/src/features/settings/presentation/riverpod/change_password_state.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_bottom_frame.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_input_field_header.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_password_input_field.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_button.dart';
import 'package:buzzwire/src/shared/presentation/widgets/form_input_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordTextController = TextEditingController();
  final _newPasswordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();

  @override
  void dispose() {
    _passwordTextController.dispose();
    _newPasswordTextController.dispose();
    _confirmPasswordTextController.dispose();
    super.dispose();
  }

  void _listenToUiState() {
    ref.listen(
      changePasswordControllerProvider,
      (previous, next) async {
        if (next.loadState is Error && previous?.loadState is! Error) {
          final message = (next.loadState as Error).message;
          context.showSingleButtonAlert(BuzzWireStrings.error, message,
              buttonText: BuzzWireStrings.retry);
        }

        if (next.loadState is Loaded) {
          await context.showSingleButtonAlert(
              "Success", "Password changed successfully");
          if (mounted) context.pop();
        }
      },
    );
  }

  void _changePasswordClick() {
    ref
        .read(
          changePasswordControllerProvider.notifier,
        )
        .changePassword(
          _passwordTextController.text,
          _newPasswordTextController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    _listenToUiState();

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SafeArea(child: _buildBody()),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return BuzzWireAppBar(
      title: Text(
        "Change Password",
        style: context.titleLarge?.copyWith(fontSize: 20),
      ),
    );
  }

  Widget _buildBody() {
    final uiState = ref.watch(changePasswordControllerProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          _buildContent(uiState),
          _buildBottomFrame(uiState),
        ],
      ),
    );
  }

  Expanded _buildContent(ChangePasswordState uiState) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Text(
            BuzzWireStrings.changePasswordScreenDesc,
            style: context.bodySmall,
          ),
          const Gap(30),
          _buildPasswordInputSection(
            uiState: uiState,
            headerTitle: "Current Password",
            hintText: "Enter your current password",
            textEditingController: _passwordTextController,
            textInputAction: TextInputAction.next,
            onChanged: (value) => ref
                .read(changePasswordControllerProvider.notifier)
                .validateCurrentPassword(value),
          ),
          const Gap(16),
          _buildPasswordInputSection(
            uiState: uiState,
            headerTitle: "New Password",
            hintText: "Enter your new password",
            textEditingController: _newPasswordTextController,
            textInputAction: TextInputAction.next,
            onChanged: (value) => ref
                .read(changePasswordControllerProvider.notifier)
                .validateNewPassword(value, _passwordTextController.text),
            validator: (value) {
              if (value != null) {
                return value.isNotEmpty &&
                        value == _passwordTextController.text &&
                        _passwordTextController.text.isNotEmpty
                    ? "New password must be different from current password"
                    : null;
              }

              return null;
            },
          ),
          const Gap(16),
          _buildPasswordInputSection(
            uiState: uiState,
            headerTitle: "Confirm Password",
            hintText: "Please confirm password",
            textEditingController: _confirmPasswordTextController,
            textInputAction: TextInputAction.done,
            onChanged: (value) => ref
                .read(changePasswordControllerProvider.notifier)
                .validateConfirmPassword(
                    value, _newPasswordTextController.text),
            validator: (value) {
              if (value != null) {
                return value.isNotEmpty &&
                        value != _newPasswordTextController.text &&
                        _newPasswordTextController.text.isNotEmpty
                    ? "Confirm password does not match new password"
                    : null;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordInputSection({
    required ChangePasswordState uiState,
    required String headerTitle,
    required String hintText,
    required TextEditingController textEditingController,
    TextInputAction? textInputAction,
    Function(String)? onChanged,
    String? Function(String?)? validator,
  }) {
    return FormInputGroup(
      isRequiredInput: true,
      headerTitle: headerTitle,
      child: BuzzWirePasswordInputField(
        controller: textEditingController,
        enabled: uiState.loadState is! Loading,
        textInputAction: textInputAction,
        hintText: hintText,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }

  Widget _buildBottomFrame(ChangePasswordState uiState) {
    final isButtonEnabled = uiState.isOldPasswordValid &&
        uiState.isNewPasswordValid &&
        uiState.isConfirmPasswordValid;
    return BuzzWireBottomFrame(
      child: BuzzWireProgressButton(
        isDisabled: !isButtonEnabled,
        text: const Text("Change Password"),
        isLoading: uiState.loadState is Loading,
        onPressed: _changePasswordClick,
      ),
    );
  }
}
