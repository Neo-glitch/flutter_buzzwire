import '../../../../../core/common/widgets/app_icon.dart';
import '../../../../../core/constants/asset_strings.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/navigation/route.dart';
import '../../../../../core/utils/device/device_utility.dart';
import '../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../core/utils/logging/logger_helper.dart';
import 'widgets/signin_header.dart';
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
  bool _showPassword = false;

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
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
                  style:
                      context.titleSmall!.copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  BuzzWireStrings.loginSubTitleText,
                  style: context.bodyMedium,
                ),
                const Gap(15),
                const TextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter email",
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                const Gap(10),
                TextField(
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
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () =>
                        context.pushNamed(BuzzWireRoute.passwordReset.name),
                    child: const Text("Forgot Password"),
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Login")),
                const Gap(40),
                Center(
                  child: RichText(
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
                              context.pushNamed(BuzzWireRoute.signUp.name);
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
    );
  }
}
