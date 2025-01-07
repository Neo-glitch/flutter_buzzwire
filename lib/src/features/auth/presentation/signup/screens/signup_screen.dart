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
import 'package:buzzwire/src/shared/domain/entity/country_entity.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_bottom_frame.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_country_picker.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_email_input_field.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_input_field_header.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_password_input_field.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_button.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_icon.dart';
import 'package:buzzwire/src/shared/presentation/widgets/form_input_group.dart';

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
  final _userNameTextController = TextEditingController();
  final _phoneNumberTextController = TextEditingController();
  final _countryController = TextEditingController();
  final FocusNode _phoneNumberFocusNode = FocusNode();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _userNameTextController.dispose();
    _phoneNumberTextController.dispose();
    _countryController.dispose();
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  void _listenToSignupState() {
    ref.listen(signUpControllerProvider, (previous, next) {
      if (next.loadState is Error && previous?.loadState is! Error) {
        final message = (next.loadState as Error).message;
        context.showSingleButtonAlert(BuzzWireStrings.error, message);
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

    return Scaffold(
      appBar: const BuzzWireAppBar(),
      body: SafeArea(child: _buildBody()),
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

  Widget _buildContent() {
    final uiState = ref.watch(signUpControllerProvider);

    final bool isButtonEnabled = uiState.isEmailValid &&
        uiState.isUserNameFilled &&
        uiState.isPasswordValid &&
        uiState.country != null;
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BuzzWireAppIcon(mainAxisAlignment: MainAxisAlignment.center),
            _buildSignupLogo(),
            const Gap(20),
            _buildHeader(),
            const Gap(24),
            _buildUsernameInputSection(uiState),
            const Gap(28),
            _buildEmailInputSection(uiState),
            const Gap(28),
            _buildCountryPickerSection(uiState),
            const Gap(28),
            _buildPhoneNumberInputSection(uiState),
            const Gap(28),
            _buildPasswordInputSection(uiState),
            const Gap(40),
            _buildSignupButton(uiState, isButtonEnabled),
          ],
        ),
      ),
    );
  }

  Widget _buildCountryPickerSection(SignupState uiState) {
    return FormInputGroup(
      headerTitle: "Country",
      isRequiredInput: true,
      child: BuzzWireCountryPicker(
        isEnabled: uiState.loadState is! Loading,
        onSelected: (country) {
          final countryEntity = CountryEntity(
            name: country.name,
            code: country.countryCode,
          );
          ref.read(signUpControllerProvider.notifier).setCountry(countryEntity);
        },
        countryController: _countryController,
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

  Widget _buildUsernameInputSection(SignupState signupState) {
    return FormInputGroup(
      headerTitle: "Username",
      isRequiredInput: true,
      child: TextFormField(
        controller: _userNameTextController,
        enabled: signupState.loadState is! Loading,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          hintText: "Enter user name",
        ),
        onChanged: (value) =>
            ref.read(signUpControllerProvider.notifier).vaidateUserName(value),
      ),
    );
  }

  Widget _buildEmailInputSection(SignupState signupState) {
    return FormInputGroup(
      headerTitle: "Email",
      isRequiredInput: true,
      child: BuzzWireEmailInputField(
        controller: _emailTextController,
        enabled: signupState.loadState is! Loading,
        textInputAction: TextInputAction.next,
        suffixIcon:
            signupState.isEmailValid ? const Icon(Icons.check_circle) : null,
        onEditingComplete: () =>
            FocusScope.of(context).requestFocus(_phoneNumberFocusNode),
        onChanged: (value) =>
            ref.read(signUpControllerProvider.notifier).validateEmail(value),
      ),
    );
  }

  Widget _buildPhoneNumberInputSection(SignupState uiState) {
    return FormInputGroup(
      headerTitle: "Phone",
      isRequiredInput: true,
      child: TextField(
        decoration: const InputDecoration(
          hintText: "Enter phone number",
        ),
        enabled: uiState.loadState is! Loading,
        focusNode: _phoneNumberFocusNode,
        keyboardType: TextInputType.phone,
        controller: _phoneNumberTextController,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Widget _buildPasswordInputSection(SignupState signupState) {
    return FormInputGroup(
      headerTitle: "Password",
      isRequiredInput: true,
      child: BuzzWirePasswordInputField(
        controller: _passwordTextController,
        enabled: signupState.loadState is! Loading,
        textInputAction: TextInputAction.done,
        onChanged: (value) =>
            ref.read(signUpControllerProvider.notifier).validatePassword(value),
      ),
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
              userName: _userNameTextController.text,
              phone: _phoneNumberTextController.text,
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
