import 'package:buzzwire/core/common/riverpod/load_state.dart';
import 'package:buzzwire/core/common/widgets/progress_button.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/src/features/auth/presentation/signin/riverpod/sigin_controller.dart';

import '../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../core/constants/asset_strings.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/strings.dart';
import '../../../../../../core/navigation/route.dart';
import '../../../../../../core/utils/device/device_utility.dart';
import '../../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../../core/utils/logging/logger_helper.dart';
import '../widgets/signin_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool _showPassword = false;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final signInState = ref.watch(signInControllerProvider);
    bool isBtnEnabled = signInState.isEmailValid && signInState.isPasswordValid;

    ref.listen(signInControllerProvider, (previous, next) {
      if (next.loadState is Error) {
        final message = (next.loadState as Error).message;
        context.showSingleButtonAlert("Error", message).then(
          (value) {
            ref.read(signInControllerProvider.notifier).hasSeenError();
          },
        );
      }
    });

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const BuzzWireAppIcon(alignment: MainAxisAlignment.center),
                  const Gap(20),
                  SvgPicture.asset(
                    BuzzWireAssets.signInLogo,
                    semanticsLabel: "SingIn Logo",
                    fit: BoxFit.cover,
                    width: BuzzWireDeviceUtils.getScreenWidth(context),
                    height: BuzzWireDeviceUtils.getScreenHeight(context) * 0.3,
                  ),
                  Text(
                    BuzzWireStrings.loginTitleText,
                    style: context.titleSmall!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    BuzzWireStrings.loginSubTitleText,
                    style: context.bodyMedium,
                  ),
                  const Gap(15),
                  TextFormField(
                    controller: _emailTextController,
                    enabled: signInState.loadState is! Loading,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter email",
                      prefixIcon: const Icon(Icons.email_outlined),
                      suffixIcon: signInState.isEmailValid
                          ? const Icon(Icons.check_circle)
                          : null,
                    ),
                    onChanged: (value) => ref
                        .read(signInControllerProvider.notifier)
                        .validateEmail(value),
                  ),
                  const Gap(15),
                  TextFormField(
                    controller: _passwordTextController,
                    enabled: signInState.loadState is! Loading,
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
                        .read(signInControllerProvider.notifier)
                        .validatePassword(value),
                    validator: (value) {
                      return !value?.isValidPassword()
                          ? "Please ensure your password is up to 6 characters"
                          : null;
                    },
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () =>
                          context.pushNamed(BuzzWireRoute.passwordReset.name),
                      child: const Text("Forgot Password"),
                    ),
                  ),
                  const Gap(4),
                  ProgressButton(
                    isDisabled: !isBtnEnabled,
                    isLoading: signInState.loadState is Loading,
                    onPressed: () {
                      ref.read(signInControllerProvider.notifier).signIn(
                            email: _emailTextController.text,
                            password: _passwordTextController.text,
                          );
                    },
                    text: const Text("Login"),
                  ),
                  const Gap(20),
                  Center(
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: context.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                            children: [
                              const TextSpan(text: "Don't have an account? "),
                              TextSpan(
                                text: "Create an Account",
                                style: context.bodyMedium!.copyWith(
                                  color: BuzzWireColors.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context
                                        .pushNamed(BuzzWireRoute.signUp.name);
                                  },
                              )
                            ],
                          ),
                        ),
                        const Gap(10),
                        RichText(
                          text: TextSpan(
                            style: context.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                            children: [
                              const TextSpan(text: "Email not verified? "),
                              TextSpan(
                                text: "Verify email",
                                style: context.bodyMedium!.copyWith(
                                  color: BuzzWireColors.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.pushNamed(
                                        BuzzWireRoute.verifyEmail.name);
                                  },
                              )
                            ],
                          ),
                        ),
                      ],
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
