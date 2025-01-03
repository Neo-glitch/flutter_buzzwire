import 'package:buzzwire/src/features/auth/presentation/signin/riverpod/signin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/gestures.dart';

import 'package:buzzwire/core/constants/asset_strings.dart';
import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/navigation/route.dart';
import 'package:buzzwire/core/utils/device/device_utility.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';

import 'package:buzzwire/src/features/auth/presentation/signin/riverpod/sigin_controller.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_bottom_frame.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_button.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_icon.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
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

  @override
  Widget build(BuildContext context) {
    final signInState = ref.watch(signInControllerProvider);
    final isBtnEnabled =
        signInState.isEmailValid && signInState.isPasswordValid;

    ref.listen(signInControllerProvider, (previous, next) {
      if (next.loadState is Error && previous?.loadState is! Error) {
        final error = (next.loadState as Error).message;
        context.showSingleButtonAlert(BuzzWireStrings.error, error).then((_) {
          ref.read(signInControllerProvider.notifier);
        });
      }
    });

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuzzWireAppIcon(
                          mainAxisAlignment: MainAxisAlignment.center),
                      const Gap(20),
                      _buildLogo(context),
                      _buildTitle(context),
                      const Gap(15),
                      _buildEmailField(signInState),
                      const Gap(15),
                      _buildPasswordField(signInState),
                      _buildForgotPasswordButton(context),
                      const Gap(4),
                      _buildSignInButton(signInState, isBtnEnabled),
                      const Gap(20),
                    ],
                  ),
                ),
              ),
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        BuzzWireAssets.signInLogo,
        semanticsLabel: "SignIn Logo",
        fit: BoxFit.cover,
        width: BuzzWireDeviceUtils.getScreenWidth(context),
        height: BuzzWireDeviceUtils.getScreenHeight(context) * 0.3,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          BuzzWireStrings.loginTitleText,
          style: context.titleSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        Text(
          BuzzWireStrings.loginSubTitleText,
          style: context.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildEmailField(SigninState signInState) {
    return TextFormField(
      controller: _emailController,
      enabled: signInState.loadState is! Loading,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Enter email",
        prefixIcon: const Icon(Icons.email_outlined),
        suffixIcon:
            signInState.isEmailValid ? const Icon(Icons.check_circle) : null,
      ),
      onChanged: (value) {
        ref.read(signInControllerProvider.notifier).validateEmail(value);
      },
    );
  }

  Widget _buildPasswordField(SigninState signInState) {
    return TextFormField(
      controller: _passwordController,
      enabled: signInState.loadState is! Loading,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      obscureText: !_showPassword,
      decoration: InputDecoration(
        hintText: "Enter password",
        prefixIcon: const Icon(Icons.lock_outline_rounded),
        suffixIcon: GestureDetector(
          onTap: _togglePasswordVisibility,
          child: Icon(
            _showPassword ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      onChanged: (value) {
        ref.read(signInControllerProvider.notifier).validatePassword(value);
      },
      validator: (value) {
        return !value.orEmpty.isValidPassword() &&
                signInState.loadState is Error
            ? "Please ensure your password is at least 6 characters"
            : null;
      },
    );
  }

  Widget _buildForgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => context.pushNamed(BuzzWireRoute.passwordReset.name),
        child: const Text("Forgot Password"),
      ),
    );
  }

  Widget _buildSignInButton(SigninState signInState, bool isBtnEnabled) {
    return BuzzWireProgressButton(
      isDisabled: !isBtnEnabled,
      isLoading: signInState.loadState is Loading,
      onPressed: () {
        ref.read(signInControllerProvider.notifier).signIn(
              email: _emailController.text,
              password: _passwordController.text,
            );
      },
      text: const Text("Login"),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return BuzzWireBottomFrame(
      child: Center(
        child: Column(
          children: [
            _buildRichText(
              "Don't have an account? ",
              "Create an Account",
              () => context.pushNamed(BuzzWireRoute.signUp.name),
            ),
            const Gap(2),
            _buildRichText(
              "Email not verified? ",
              "Verify email",
              () => context.pushNamed(BuzzWireRoute.verifyEmail.name),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRichText(String text, String linkText, VoidCallback onTap) {
    return RichText(
      text: TextSpan(
        style: context.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
        children: [
          TextSpan(text: text),
          TextSpan(
            text: linkText,
            style: context.bodyMedium?.copyWith(
              color: BuzzWireColors.primary,
              fontWeight: FontWeight.w700,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
