import 'package:buzzwire/core/constants/asset_strings.dart';
import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuzzWireEmptyOrErrorScreen extends StatelessWidget {
  final String header;
  final String description;
  final bool isError;
  final void Function()? onPressed;

  const BuzzWireEmptyOrErrorScreen._({
    required this.header,
    required this.description,
    required this.isError,
    this.onPressed,
    super.key,
  });

  factory BuzzWireEmptyOrErrorScreen.error({
    Key? key,
    String header = BuzzWireStrings.defaultErrorScreenHeaderTitle,
    required String message,
    required void Function() onPressed,
  }) {
    return BuzzWireEmptyOrErrorScreen._(
      header: header,
      description: message,
      isError: true,
      onPressed: onPressed,
      key: key,
    );
  }

  factory BuzzWireEmptyOrErrorScreen.empty({
    Key? key,
    String header = BuzzWireStrings.defaultEmptyScreenHeaderTitle,
    required String message,
  }) {
    return BuzzWireEmptyOrErrorScreen._(
      header: header,
      description: message,
      isError: false,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              fit: BoxFit.cover,
              height: 180,
              isError ? BuzzWireAssets.errorLogo : BuzzWireAssets.emptyDataLogo,
            ),
            Text(
              header,
              textAlign: TextAlign.center,
              style: context.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              description,
              textAlign: TextAlign.center,
            ),
            if (isError && onPressed != null)
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: onPressed,
                    child: const Text("Try again"),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
