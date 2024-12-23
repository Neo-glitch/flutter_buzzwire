import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_button.dart';
import 'package:buzzwire/core/constants/asset_strings.dart';
import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/utils/device/device_utility.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/reset_password_usecase.dart';
import 'package:buzzwire/src/features/auth/presentation/auth_controller.dart';
import 'package:buzzwire/src/features/auth/presentation/forgot_password/riverpod/forgot_password_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:gap/gap.dart';

import '../../../../../shared/presentation/widgets/buzzwire_app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
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

  @override
  Widget build(BuildContext context) {
    final forgotpasswordState = ref.watch(forgotPasswordControllerProvider);
    bool isBtnEnabled = forgotpasswordState.isEmailValid;

    ref.listen(forgotPasswordControllerProvider, (previous, next) {
      if (next.loadState is Error) {
        final message = (next.loadState as Error).message;
        context.showSingleButtonAlert("Error", message).then(
          (value) {
            ref.read(forgotPasswordControllerProvider.notifier).hasSeenError();
          },
        );
      }

      if (next.loadState is Loaded) {
        context.pop();
        context.showToast("password reset email sent successfully");
      }
    });

    return SafeArea(
      child: Scaffold(
        appBar: const BuzzWireAppBar(),
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const BuzzWireAppIcon(alignment: MainAxisAlignment.center),
                  Center(
                    child: SvgPicture.asset(
                      BuzzWireAssets.forgotPasswordLogo,
                      semanticsLabel: "Forgot password logo",
                      fit: BoxFit.cover,
                      width: BuzzWireDeviceUtils.getScreenWidth(context),
                      height:
                          BuzzWireDeviceUtils.getScreenHeight(context) * 0.3,
                    ),
                  ),
                  const Gap(30),
                  Text(
                    BuzzWireStrings.forgotPasswordTitle,
                    style: context.titleSmall!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    BuzzWireStrings.forgotPasswordSubtitle,
                    style: context.bodyMedium,
                  ),
                  const Gap(15),
                  TextFormField(
                    enabled: forgotpasswordState.loadState is! Loading,
                    controller: _emailTextController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter email",
                      prefixIcon: const Icon(Icons.email_outlined),
                      suffixIcon: forgotpasswordState.isEmailValid
                          ? const Icon(Icons.check_circle)
                          : null,
                    ),
                    onChanged: (value) {
                      ref
                          .read(forgotPasswordControllerProvider.notifier)
                          .validateEmail(value);
                    },
                  ),
                  const Gap(20),
                  BuzzWireProgressButton(
                    isLoading: forgotpasswordState.loadState is Loading,
                    isDisabled: !isBtnEnabled,
                    text: const Text("Reset password"),
                    onPressed: () {
                      ref
                          .read(forgotPasswordControllerProvider.notifier)
                          .resetPassword(email: _emailTextController.text);
                    },
                  ),
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
    );
  }
}
