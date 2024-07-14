import 'package:buzzwire/core/common/widgets/app_icon.dart';
import 'package:buzzwire/core/constants/asset_strings.dart';
import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/utils/device/device_utility.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailScreen extends ConsumerStatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends ConsumerState<VerifyEmailScreen>
    with TickerProviderStateMixin {
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
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              const BuzzWireAppIcon(alignment: MainAxisAlignment.center),
              SvgPicture.asset(
                BuzzWireAssets.verifyEmailLogo,
                semanticsLabel: "Verify email logo",
                fit: BoxFit.cover,
                width: BuzzWireDeviceUtils.getScreenWidth(context),
                height: BuzzWireDeviceUtils.getScreenHeight(context) * 0.3,
              ),
              const Gap(30),
              Text(
                BuzzWireStrings.verifyEmailTitle,
                style:
                    context.titleSmall!.copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              Text(
                BuzzWireStrings.verifyEmailSubtitle,
                style: context.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const Gap(40),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SpinKitWave(
                        color: context.primaryColor,
                        size: 30,
                        type: SpinKitWaveType.start,
                        controller: AnimationController(
                            vsync: this,
                            duration: const Duration(milliseconds: 1200)),
                      ),
                      const Gap(10),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Resend",
                            style: context.labelLarge,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
