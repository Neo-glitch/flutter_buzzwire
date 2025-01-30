import 'package:buzzwire/core/constants/asset_strings.dart';
import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/utils/device/device_utility.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/auth/presentation/email_verification/riverpod/email_verification_controller.dart';
import 'package:buzzwire/src/features/auth/presentation/email_verification/riverpod/email_verification_state.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_email_input_field.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_password_input_field.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_button.dart';
import 'package:buzzwire/src/shared/presentation/widgets/form_input_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class EmailVerificationScreen extends ConsumerStatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  ConsumerState<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState
    extends ConsumerState<EmailVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _listentToUiState() {
    ref.listen(
      emailVerificationControllerProvider,
      (previous, next) {
        if (next.loadState is Error && previous?.loadState is! Error) {
          final message = (next.loadState as Error).message;
          context.showSingleButtonAlert(BuzzWireStrings.error, message);
        }
        if (next.loadState is Loaded) {
          context.pop();
          context.showToast("Verification email sent successfully");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _listentToUiState();

    return Scaffold(
      appBar: const BuzzWireAppBar(),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Form _buildBody() {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: _buildContent(),
      ),
    );
  }

  Column _buildContent() {
    final uiState = ref.watch(emailVerificationControllerProvider);
    final isBtnEnabled = uiState.isEmailValid && uiState.isPasswordValid;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildScreenLogo(context),
        const Gap(30),
        _buildHeader(),
        const Gap(16),
        _buildEmailInputField(uiState),
        const Gap(16),
        _buildPasswordInputField(uiState),
        const Gap(20),
        BuzzWireProgressButton(
          isLoading: uiState.loadState is Loading,
          isDisabled: !isBtnEnabled,
          text: const Text("Resend Email"),
          onPressed: () => ref
              .read(emailVerificationControllerProvider.notifier)
              .signInAndSendEmailVerificationMail(
                email: _emailController.text,
                password: _passwordController.text,
              ),
        ),
        Center(
          child: TextButton(
            onPressed: () => context.pop(),
            child: Text(
              "Back to log in",
              style: context.labelLarge,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          BuzzWireStrings.emailVerificationTitle,
          style: context.titleSmall!.copyWith(fontWeight: FontWeight.w700),
        ),
        Text(
          BuzzWireStrings.emailVerificationSubtitle,
          style: context.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildScreenLogo(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        BuzzWireAssets.emailVerificationLogo,
        semanticsLabel: "Email verification logo",
        width: BuzzWireDeviceUtils.getScreenWidth(context),
        height: BuzzWireDeviceUtils.getScreenHeight(context) * 0.3,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildEmailInputField(EmailVerificationState uiState) {
    return FormInputGroup(
      headerTitle: "Email",
      child: BuzzWireEmailInputField(
        controller: _emailController,
        hintText: "Enter email",
        enabled: uiState.loadState is! Loading,
        suffixIcon:
            uiState.isEmailValid ? const Icon(Icons.check_circle) : null,
        textInputAction: TextInputAction.next,
        onChanged: (value) => ref
            .read(emailVerificationControllerProvider.notifier)
            .validateEmail(value),
      ),
    );
  }

  Widget _buildPasswordInputField(EmailVerificationState uiState) {
    return FormInputGroup(
      headerTitle: "Password",
      child: BuzzWirePasswordInputField(
        controller: _passwordController,
        enabled: uiState.loadState is! Loading,
        textInputAction: TextInputAction.done,
        onChanged: (value) => ref
            .read(emailVerificationControllerProvider.notifier)
            .validatePassword(value),
      ),
    );
  }
}
