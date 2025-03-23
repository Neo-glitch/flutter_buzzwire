import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BuzzWireProgressLoader extends StatelessWidget {
  final bool isInitialLoad;

  const BuzzWireProgressLoader({
    super.key,
    this.isInitialLoad = true,
  });

  @override
  Widget build(BuildContext context) {
    return isInitialLoad
        ? Center(
            child: SpinKitWave(
              color: context.primaryColor,
              size: 30,
            ),
          )
        : SpinKitFadingCircle(
            color: context.primaryColor,
            size: 30,
          );
  }
}
