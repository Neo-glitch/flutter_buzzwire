import 'package:buzzwire/core/constants/asset_strings.dart';
import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/utils/device/device_utility.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
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
                  BuzzWireAssets.forgotPasswordLogo,
                  semanticsLabel: "Forgot password logo",
                  fit: BoxFit.cover,
                  width: BuzzWireDeviceUtils.getScreenWidth(context),
                  height: BuzzWireDeviceUtils.getScreenHeight(context) * 0.3,
                ),
                const Gap(30),
                Text(
                  BuzzWireStrings.forgotPasswordTitle,
                  style:
                      context.titleSmall!.copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  BuzzWireStrings.forgotPasswordSubtitle,
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
                const Gap(30),
                ElevatedButton(
                    onPressed: () {}, child: const Text("Reset password")),
                const Gap(20),
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
    );
  }
}
