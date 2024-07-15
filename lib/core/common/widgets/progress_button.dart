import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';

class ProgressButton extends StatelessWidget {
  final Widget text;
  final bool isLoading;
  final bool isDisabled;
  final void Function() onPressed;
  final ButtonStyle buttonStyle;

  const ProgressButton(
      {super.key,
      required this.text,
      required this.isLoading,
      required this.onPressed,
      this.buttonStyle = const ButtonStyle(),
      this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = buttonStyle.backgroundColor?.resolve({});
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        disabledBackgroundColor: backgroundColor?.withOpacity(0.4),
      ).merge(buttonStyle),
      onPressed: isDisabled || isLoading ? null : onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          text,
          const Gap(4),
          if (isLoading)
            const SpinKitWave(
              color: Colors.white,
              size: 18,
            )
        ],
      ),
    );
  }
}
