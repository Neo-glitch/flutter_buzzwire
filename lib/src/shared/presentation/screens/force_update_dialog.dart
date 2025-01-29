import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_icon.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_bottom_frame.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForceUpdateDialog extends StatelessWidget {
  const ForceUpdateDialog({super.key});

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
            _buildContent(context),
            _buildBottomFrame(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const BuzzWireAppIcon(
                fontSize: 25,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              const Gap(5),
              const Gap(10),
              Text(
                BuzzWireStrings.updateYourApplicationToTheLatestVersion,
                style: context.titleMedium,
                textAlign: TextAlign.center,
              ),
              const Gap(10),
              Text(
                BuzzWireStrings.updateApplicationDialogDesc,
                style: context.bodySmall,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomFrame() {
    return BuzzWireBottomFrame(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(BuzzWireStrings.updateNow),
          ),
        ),
      ),
    );
  }
}
