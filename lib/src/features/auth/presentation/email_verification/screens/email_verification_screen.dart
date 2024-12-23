import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_icon.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_button.dart';
import 'package:buzzwire/core/constants/asset_strings.dart';
import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/utils/device/device_utility.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/src/features/auth/presentation/email_verification/riverpod/email_verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        appBar: const BuzzWireAppBar(),
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const BuzzWireAppIcon(alignment: MainAxisAlignment.center),
                    Center(
                      child: SvgPicture.asset(
                        BuzzWireAssets.emailVerificationLogo,
                        semanticsLabel: "Email verification logo",
                        fit: BoxFit.cover,
                        width: BuzzWireDeviceUtils.getScreenWidth(context),
                        height:
                            BuzzWireDeviceUtils.getScreenHeight(context) * 0.3,
                      ),
                    ),
                    const Gap(30),
                    Text(
                      textAlign: TextAlign.start,
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
                            .validateEmail(value);
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
                          .validatePassword(value),
                      validator: (value) {
                        return !value?.isValidPassword()
                            ? "Please ensure your password is up to 6 characters"
                            : null;
                      },
                    ),
                    const Gap(20),
                    BuzzWireProgressButton(
                        isLoading: uiState.loadState is Loading,
                        isDisabled: !isBtnEnabled,
                        text: const Text("Resend Email"),
                        onPressed: () {
                          ref
                              .read(
                                emailVerificationControllerProvider.notifier,
                              )
                              .signInAndSendEmailVerificationMail(
                                email: _emailTextController.text,
                                password: _passwordTextController.text,
                              );
                        }),
                    Center(
                        child: TextButton(
                      child: Text(
                        "Back to log in",
                        style: context.labelLarge,
                      ),
                      onPressed: () => context.pop(),
                    ))
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
