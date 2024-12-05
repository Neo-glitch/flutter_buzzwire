import 'package:buzzwire/core/common/riverpod/load_state.dart';
import 'package:buzzwire/core/common/widgets/progress_button.dart';
import 'package:buzzwire/core/constants/asset_strings.dart';
import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/utils/device/device_utility.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/core/utils/extensions/string_extensions.dart';
import 'package:buzzwire/src/features/auth/presentation/auth_controller.dart';
import 'package:buzzwire/src/features/auth/presentation/forgot_password/riverpod/forgot_password_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:gap/gap.dart';

import '../../../../../core/common/widgets/app_icon.dart';
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
          autovalidateMode: AutovalidateMode.disabled,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const BuzzWireAppIcon(alignment: MainAxisAlignment.center),
                  SvgPicture.asset(
                    BuzzWireAssets.forgotPasswordLogo,
                    semanticsLabel: "Forgot password logo",
                    fit: BoxFit.cover,
                    width: BuzzWireDeviceUtils.getScreenWidth(context),
                    height: BuzzWireDeviceUtils.getScreenHeight(context) * 0.3,
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
                          .validateEmail(_emailTextController.text);
                    },
                    validator: (value) {
                      if (!forgotpasswordState.isEmailValid) {
                        return "Please enter an email";
                      }

                      return null;
                    },
                  ),
                  const Gap(80),
                  ProgressButton(
                    isLoading: forgotpasswordState.loadState is Loading,
                    isDisabled: !isBtnEnabled,
                    text: const Text("Reset password"),
                    onPressed: () {},
                  ),
                  const Gap(10),
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
