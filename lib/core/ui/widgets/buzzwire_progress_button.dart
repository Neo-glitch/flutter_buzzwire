import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BuzzWireProgressButton extends StatelessWidget {
  final Widget text;
  final bool isLoading;
  final bool isDisabled;
  final void Function() onPressed;
  final ButtonStyle buttonStyle;

  const BuzzWireProgressButton(
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
          if (!isLoading) text,
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
