import 'package:buzzwire/core/common/widgets/app_icon.dart';
import 'package:buzzwire/core/constants/asset_strings.dart';
import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/utils/device/device_utility.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/auth/presentation/signin/widgets/signin_header.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                const BuzzWireAppIcon(alignment: MainAxisAlignment.center),
                const Gap(20),
                SvgPicture.asset(
                  BuzzWireAssets.signInLogo,
                  semanticsLabel: "OnBoarding Image",
                  fit: BoxFit.cover,
                  width: BuzzWireDeviceUtils.getScreenWidth(context),
                  height: BuzzWireDeviceUtils.getScreenHeight(context) * 0.3,
                ),
                const Gap(30),
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
                const Gap(15),
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
                    onPressed: () {},
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
                        const TextSpan(text: "Don't have an account ? "),
                        TextSpan(
                          text: "Create an Account",
                          style: context.bodyMedium!.copyWith(
                            color: BuzzWireColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // TODO Go to Reset PAssword screen
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
