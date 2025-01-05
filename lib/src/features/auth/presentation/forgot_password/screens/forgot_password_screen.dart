// Core imports
import 'package:buzzwire/core/constants/asset_strings.dart';
import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/utils/device/device_utility.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
// Features and shared widgets
import 'package:buzzwire/src/features/auth/presentation/forgot_password/riverpod/forgot_password_controller.dart';
import 'package:buzzwire/src/features/auth/presentation/forgot_password/riverpod/forgot_password_state.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_icon.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_email_input_field.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_button.dart';
import 'package:buzzwire/src/shared/presentation/widgets/form_input_group.dart';
// External packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  void _listenToForgotPasswordState() {
    ref.listen(forgotPasswordControllerProvider, (previous, next) {
      if (next.loadState is Error && previous?.loadState is! Error) {
        final message = (next.loadState as Error).message;
        context.showSingleButtonAlert("Error", message);
      }

      if (next.loadState is Loaded) {
        context.pop();
        context.showToast("Password reset email sent successfully");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _listenToForgotPasswordState();

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
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          _buildContent(),
        ],
      ),
    );
  }

  Expanded _buildContent() {
    final forgotPasswordState = ref.watch(forgotPasswordControllerProvider);
    final bool isButtonEnabled = forgotPasswordState.isEmailValid;

    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BuzzWireAppIcon(mainAxisAlignment: MainAxisAlignment.center),
            _buildForgotPasswordLogo(),
            const Gap(30),
            _buildHeader(),
            const Gap(15),
            _buildEmailField(forgotPasswordState),
            const Gap(20),
            _buildResetPasswordButton(forgotPasswordState, isButtonEnabled),
            _buildBackToLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildForgotPasswordLogo() {
    return Center(
      child: SvgPicture.asset(
        BuzzWireAssets.forgotPasswordLogo,
        semanticsLabel: "Forgot password logo",
        fit: BoxFit.cover,
        width: BuzzWireDeviceUtils.getScreenWidth(context),
        height: BuzzWireDeviceUtils.getScreenHeight(context) * 0.3,
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          BuzzWireStrings.forgotPasswordTitle,
          style: context.titleSmall!.copyWith(fontWeight: FontWeight.w700),
        ),
        Text(
          BuzzWireStrings.forgotPasswordSubtitle,
          style: context.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildEmailField(ForgotPasswordState forgotPasswordState) {
    return FormInputGroup(
      headerTitle: "Email",
      child: BuzzWireEmailInputField(
        controller: _emailTextController,
        textInputAction: TextInputAction.done,
        enabled: forgotPasswordState.loadState is! Loading,
        suffixIcon: forgotPasswordState.isEmailValid
            ? const Icon(Icons.check_circle)
            : null,
        onChanged: (value) => ref
            .read(forgotPasswordControllerProvider.notifier)
            .validateEmail(value),
      ),
    );
  }

  Widget _buildResetPasswordButton(
      ForgotPasswordState forgotPasswordState, bool isButtonEnabled) {
    return BuzzWireProgressButton(
      isLoading: forgotPasswordState.loadState is Loading,
      isDisabled: !isButtonEnabled,
      text: const Text("Reset password"),
      onPressed: () {
        ref
            .read(forgotPasswordControllerProvider.notifier)
            .resetPassword(email: _emailTextController.text);
      },
    );
  }

  Widget _buildBackToLoginButton() {
    return Center(
      child: TextButton(
        onPressed: () => context.pop(),
        child: Text("Back to log in", style: context.labelLarge),
      ),
    );
  }
}
