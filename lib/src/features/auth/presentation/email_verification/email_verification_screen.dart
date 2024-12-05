import 'package:buzzwire/core/common/riverpod/load_state.dart';
import 'package:buzzwire/core/common/widgets/app_icon.dart';
import 'package:buzzwire/core/common/widgets/progress_button.dart';
import 'package:buzzwire/core/constants/asset_strings.dart';
import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/utils/device/device_utility.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/auth/presentation/email_verification/riverpod/email_verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class EmailVerificationScreen extends ConsumerStatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends ConsumerState<EmailVerificationScreen> {
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
    final uiState = ref.watch(emailVerificationControllerProvider);
    bool isBtnEnabled = uiState.isEmailValid && uiState.isPasswordValid;

    ref.listen(emailVerificationControllerProvider, (previous, next) {
      if (next.loadState is Error) {
        final message = (next.loadState as Error).message;
        context.showSingleButtonAlert("Error", message).then(
          (value) {
            ref
                .read(emailVerificationControllerProvider.notifier)
                .hasSeenError();
          },
        );
      }

      if (next.loadState is Loaded) {
        context.pop();
        context.showToast("Verification email sent successfully");
      }
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 24,
            ),
            onPressed: () => context.pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const BuzzWireAppIcon(alignment: MainAxisAlignment.center),
                    SvgPicture.asset(
                      BuzzWireAssets.emailVerificationLogo,
                      semanticsLabel: "Email verification logo",
                      fit: BoxFit.cover,
                      width: BuzzWireDeviceUtils.getScreenWidth(context),
                      height:
                          BuzzWireDeviceUtils.getScreenHeight(context) * 0.3,
                    ),
                    const Gap(30),
                    Text(
                      BuzzWireStrings.emailVerificationTitle,
                      style: context.titleSmall!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      BuzzWireStrings.emailVerificationSubtitle,
                      style: context.bodyMedium,
                    ),
                    const Gap(15),
                    TextFormField(
                      enabled: uiState.loadState is! Loading,
                      controller: _emailTextController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter email",
                        prefixIcon: const Icon(Icons.email_outlined),
                        suffixIcon: uiState.isEmailValid
                            ? const Icon(Icons.check_circle)
                            : null,
                      ),
                      onChanged: (value) {
                        ref
                            .read(emailVerificationControllerProvider.notifier)
                            .validateEmail(_emailTextController.text);
                      },
                      validator: (value) {
                        if (!uiState.isEmailValid) {
                          return "Please enter an email";
                        }

                        return null;
                      },
                    ),
                    const Gap(10),
                    TextFormField(
                      controller: _passwordTextController,
                      enabled: uiState.loadState is! Loading,
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
                          .read(emailVerificationControllerProvider.notifier)
                          .validatePassword(_passwordTextController.text),
                    ),
                    const Gap(75),
                    ProgressButton(
                        isLoading: uiState.loadState is Loading,
                        isDisabled: !isBtnEnabled,
                        text: const Text("Resend Email"),
                        onPressed: () {
                          ref
                              .read(
                                emailVerificationControllerProvider.notifier,
                              )
                              .signInAndResendVerificationEmail(
                                email: _emailTextController.text,
                                password: _passwordTextController.text,
                              );
                        }),
                    const Gap(10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
