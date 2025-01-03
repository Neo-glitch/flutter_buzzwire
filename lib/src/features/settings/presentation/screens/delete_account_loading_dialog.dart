import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';

class DeleteAccountLoadingDialog extends StatelessWidget {
  const DeleteAccountLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      insetPadding: EdgeInsets.zero,
      child: PopScope(
        canPop: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BuzzWireAppIcon(
              fontSize: 30,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const Gap(10),
            const Text(BuzzWireStrings.deletingYourAccount),
            const Gap(50),
            SpinKitRing(
              color: context.primaryColor,
              lineWidth: 4,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
