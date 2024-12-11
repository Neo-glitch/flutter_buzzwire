import 'package:buzzwire/core/common/widgets/buzzwire_progress_button.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/src/features/auth/presentation/signup/riverpod/signup_controller.dart';
import 'package:buzzwire/src/features/auth/presentation/signup/riverpod/signup_state.dart';

import '../../../../../../core/common/riverpod/load_state.dart';
import '../../../../../../core/common/widgets/buzzwire_app_icon.dart';
import '../../../../../../core/constants/asset_strings.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/strings.dart';
import '../../../../../../core/utils/device/device_utility.dart';
import '../../../../../../core/utils/extensions/context_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

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

  @override
  Widget build(BuildContext context) {
    final signupState = ref.watch(signUpControllerProvider);
    bool isBtnEnabled = signupState.isEmailValid &&
        signupState.isFullNameFilled &&
        signupState.isPasswordValid;

    ref.listen(signUpControllerProvider, (previous, next) {
      if (next.loadState is Error) {
        final message = (next.loadState as Error).message;
        context.showSingleButtonAlert("Error", message).then(
          (value) {
            ref.read(signUpControllerProvider.notifier).hasSeenError();
          },
        );
      }

      if (next.loadState is Loaded) {
        context.pop();
        context.showToast("A verification email has been sent to you");
      }
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 24,
            ),
            onPressed: () => context.pop(),
          ),
        ),
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const BuzzWireAppIcon(alignment: MainAxisAlignment.center),
                  SvgPicture.asset(
                    BuzzWireAssets.signupLogo,
                    semanticsLabel: "Signup Logo",
                    fit: BoxFit.cover,
                    width: BuzzWireDeviceUtils.getScreenWidth(context),
                    height: BuzzWireDeviceUtils.getScreenHeight(context) * 0.3,
                  ),
                  const Gap(30),
                  Text(
                    BuzzWireStrings.signupTitleText,
                    style: context.titleSmall!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    BuzzWireStrings.signupSubTitleText,
                    style: context.bodyMedium,
                  ),
                  const Gap(15),
                  TextFormField(
                    enabled: signupState.loadState is! Loading,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    controller: _fullNameTextController,
                    decoration: const InputDecoration(
                      hintText: "Enter full name",
                      prefixIcon: Icon(Icons.person),
                    ),
                    onChanged: (value) => ref
                        .read(signUpControllerProvider.notifier)
                        .vaidateUserName(value),
                  ),
                  const Gap(15),
                  TextFormField(
                    controller: _emailTextController,
                    enabled: signupState.loadState is! Loading,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter email",
                      prefixIcon: const Icon(Icons.email_outlined),
                      suffixIcon: signupState.isEmailValid
                          ? const Icon(Icons.check_circle)
                          : null,
                    ),
                    onChanged: (value) => ref
                        .read(signUpControllerProvider.notifier)
                        .validateEmail(value),
                  ),
                  const Gap(15),
                  TextFormField(
                    controller: _passwordTextController,
                    enabled: signupState.loadState is! Loading,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _togglePasswordVisibility();
                        },
                        child: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    onChanged: (value) => ref
                        .read(signUpControllerProvider.notifier)
                        .validatePassword(value),
                    validator: (value) {
                      return !value?.isValidPassword()
                          ? "Please ensure your password is up to 6 characters"
                          : null;
                    },
                  ),
                  const Gap(20),
                  BuzzWireProgressButton(
                    isDisabled: !isBtnEnabled,
                    isLoading: signupState.loadState is Loading,
                    onPressed: () {
                      ref.read(signUpControllerProvider.notifier).signUp(
                            email: _emailTextController.text,
                            password: _passwordTextController.text,
                          );
                    },
                    text: const Text("Signup"),
                  ),
                  const Gap(20),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: context.bodyMedium!
                            .copyWith(fontWeight: FontWeight.w700),
                        children: [
                          const TextSpan(text: "Already have an account? "),
                          TextSpan(
                            text: "Login?",
                            style: context.bodyMedium!.copyWith(
                              color: BuzzWireColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pop();
                              },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
