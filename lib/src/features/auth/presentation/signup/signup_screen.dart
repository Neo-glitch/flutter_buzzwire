import '../../../../../core/common/widgets/app_icon.dart';
import '../../../../../core/constants/asset_strings.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/utils/device/device_utility.dart';
import '../../../../../core/utils/extensions/context_extension.dart';
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
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                  style:
                      context.titleSmall!.copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  BuzzWireStrings.signupSubTitleText,
                  style: context.bodyMedium,
                ),
                const Gap(15),
                const TextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Enter full name",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const Gap(10),
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
                const Gap(30),
                ElevatedButton(onPressed: () {}, child: const Text("Signup")),
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
    );
  }
}
