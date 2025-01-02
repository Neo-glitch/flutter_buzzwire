import 'package:buzzwire/core/constants/asset_strings.dart';
import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/utils/device/device_utility.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/src/features/auth/presentation/email_verification/riverpod/email_verification_controller.dart';
import 'package:buzzwire/src/features/auth/presentation/email_verification/riverpod/email_verification_state.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_icon.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_button.dart';
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
  bool _showPassword = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() => _showPassword = !_showPassword);
  }

  void _listentToUiState() {
    ref.listen(emailVerificationControllerProvider, (previous, next) {
      if (next.loadState is Error) {
        final message = (next.loadState as Error).message;
        context.showSingleButtonAlert("Error", message).then((_) {
          ref.read(emailVerificationControllerProvider.notifier).hasSeenError();
        });
      }
      if (next.loadState is Loaded) {
        context.pop();
        context.showToast("Verification email sent successfully");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _listentToUiState();

    return SafeArea(
      child: Scaffold(
        appBar: const BuzzWireAppBar(),
        body: _buildBody(),
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
        const BuzzWireAppIcon(alignment: MainAxisAlignment.center),
        _buildScreenLogo(context),
        const Gap(30),
        ..._buildHeader(),
        const Gap(15),
        _buildEmailInputField(uiState),
        const Gap(10),
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

  List<Widget> _buildHeader() {
    return [
      Text(
        BuzzWireStrings.emailVerificationTitle,
        style: context.titleSmall!.copyWith(fontWeight: FontWeight.w700),
      ),
      Text(
        BuzzWireStrings.emailVerificationSubtitle,
        style: context.bodyMedium,
      ),
    ];
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
    return _buildTextFormField(
      controller: _emailController,
      label: "Enter email",
      icon: Icons.email_outlined,
      isEnabled: uiState.loadState is! Loading,
      isValid: uiState.isEmailValid,
      onChanged: (value) => ref
          .read(emailVerificationControllerProvider.notifier)
          .validateEmail(value),
      validator: (value) =>
          uiState.isEmailValid ? null : "Please enter an email",
    );
  }

  Widget _buildPasswordInputField(EmailVerificationState uiState) {
    return _buildTextFormField(
      controller: _passwordController,
      label: "Enter password",
      icon: Icons.lock_outline_rounded,
      isEnabled: uiState.loadState is! Loading,
      obscureText: !_showPassword,
      textInputAction: TextInputAction.done,
      onChanged: (value) => ref
          .read(emailVerificationControllerProvider.notifier)
          .validatePassword(value),
      validator: (value) => value?.isValidPassword() == true
          ? null
          : "Please ensure your password is at least 6 characters",
      suffixIcon: GestureDetector(
        onTap: _togglePasswordVisibility,
        child: Icon(
          _showPassword ? Icons.visibility : Icons.visibility_off,
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required bool isEnabled,
    required ValueChanged<String> onChanged,
    FormFieldValidator<String>? validator,
    bool obscureText = false,
    Widget? suffixIcon,
    bool isValid = false,
    TextInputAction textInputAction = TextInputAction.next,
  }) {
    return TextFormField(
      controller: controller,
      enabled: isEnabled,
      textInputAction: textInputAction,
      keyboardType: obscureText
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: label,
        prefixIcon: Icon(icon),
        suffixIcon:
            suffixIcon ?? (isValid ? const Icon(Icons.check_circle) : null),
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
