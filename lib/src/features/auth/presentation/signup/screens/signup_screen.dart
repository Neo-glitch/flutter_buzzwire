// Core imports
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/core/utils/device/device_utility.dart';
import 'package:buzzwire/core/constants/asset_strings.dart';
import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';

// Features and shared widgets
import 'package:buzzwire/src/features/auth/presentation/signup/riverpod/signup_controller.dart';
import 'package:buzzwire/src/features/auth/presentation/signup/riverpod/signup_state.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_bottom_frame.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_button.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_icon.dart';

// External packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/gestures.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _fullNameTextController = TextEditingController();

  bool _showPassword = false;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _fullNameTextController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void _listenToSignupState() {
    ref.listen(signUpControllerProvider, (previous, next) {
      if (next.loadState is Error) {
        final message = (next.loadState as Error).message;
        context.showSingleButtonAlert("Error", message).then(
              (_) => ref.read(signUpControllerProvider.notifier).hasSeenError(),
            );
      }

      if (next.loadState is Loaded) {
        context.pop();
        context.showToast("A verification email has been sent to you");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _listenToSignupState();

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
      child: Column(
        children: [
          _buildContent(),
          _buildBottomFrame(),
        ],
      ),
    );
  }

  Expanded _buildContent() {
    final signupState = ref.watch(signUpControllerProvider);

    final bool isButtonEnabled = signupState.isEmailValid &&
        signupState.isFullNameFilled &&
        signupState.isPasswordValid;
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BuzzWireAppIcon(alignment: MainAxisAlignment.center),
            _buildSignupLogo(),
            const Gap(20),
            _buildHeader(),
            const Gap(15),
            _buildFullNameField(signupState),
            const Gap(15),
            _buildEmailField(signupState),
            const Gap(15),
            _buildPasswordField(signupState),
            const Gap(20),
            _buildSignupButton(signupState, isButtonEnabled),
          ],
        ),
      ),
    );
  }

  Widget _buildSignupLogo() {
    return Center(
      child: SvgPicture.asset(
        BuzzWireAssets.signupLogo,
        semanticsLabel: "Signup Logo",
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
          BuzzWireStrings.signupTitleText,
          style: context.titleSmall!.copyWith(fontWeight: FontWeight.w700),
        ),
        Text(
          BuzzWireStrings.signupSubTitleText,
          style: context.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildFullNameField(SignupState signupState) {
    return TextFormField(
      controller: _fullNameTextController,
      enabled: signupState.loadState is! Loading,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        hintText: "Enter full name",
        prefixIcon: Icon(Icons.person),
      ),
      onChanged: (value) =>
          ref.read(signUpControllerProvider.notifier).vaidateUserName(value),
    );
  }

  Widget _buildEmailField(SignupState signupState) {
    return TextFormField(
      controller: _emailTextController,
      enabled: signupState.loadState is! Loading,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Enter email",
        prefixIcon: const Icon(Icons.email_outlined),
        suffixIcon:
            signupState.isEmailValid ? const Icon(Icons.check_circle) : null,
      ),
      onChanged: (value) =>
          ref.read(signUpControllerProvider.notifier).validateEmail(value),
    );
  }

  Widget _buildPasswordField(SignupState signupState) {
    return TextFormField(
      controller: _passwordTextController,
      enabled: signupState.loadState is! Loading,
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
      onChanged: (value) =>
          ref.read(signUpControllerProvider.notifier).validatePassword(value),
      validator: (value) => value?.isValidPassword()
          ? "Please ensure your password is up to 6 characters"
          : null,
    );
  }

  Widget _buildSignupButton(SignupState signupState, bool isButtonEnabled) {
    return BuzzWireProgressButton(
      isDisabled: !isButtonEnabled,
      isLoading: signupState.loadState is Loading,
      onPressed: () {
        ref.read(signUpControllerProvider.notifier).signUp(
              email: _emailTextController.text,
              password: _passwordTextController.text,
            );
      },
      text: const Text("Signup"),
    );
  }

  Widget _buildBottomFrame() {
    return BuzzWireBottomFrame(
      child: Center(
        child: RichText(
          text: TextSpan(
            style: context.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
            children: [
              const TextSpan(text: "Already have an account? "),
              TextSpan(
                text: "Login?",
                style: context.bodyMedium!.copyWith(
                  color: BuzzWireColors.primary,
                  fontWeight: FontWeight.w700,
                ),
                recognizer: TapGestureRecognizer()..onTap = () => context.pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
