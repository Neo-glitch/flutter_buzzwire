import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../constants/sizes.dart';

class BuzzWireHelperFunctions {
  BuzzWireHelperFunctions._();

  static Color? getColor(String value) {
    final color = switch (value) {
      "Green" => Colors.green,
      "Red" => Colors.red,
      "Blue" => Colors.blue,
      "Pink" => Colors.pink,
      "Grey" => Colors.grey,
      "Purple" => Colors.purple,
      "Black" => Colors.black,
      "White" => Colors.white,
      "Brown" => Colors.brown,
      "Teal" => Colors.teal,
      "Indigo" => Colors.indigo,
      _ => null,
    };
    return color;
  }

  static void showSnackbar(
    BuildContext context,
    String message, {
    Function()? action,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          content: Text(message),
          action: action != null
              ? SnackBarAction(
                  label: "Retry",
                  onPressed: () {
                    action();
                  },
                )
              : null,
        ),
      );
  }

  // Todo:Improve on this and make use of custom dialog rather than alert dialog
  static void showSingleButtonAlert(
    BuildContext context,
    String title,
    String message,
  ) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop,
                child: const Text("Ok"),
              )
            ],
          );
        });
  }

  static void showDoubleButtonAlert(
    BuildContext context,
    String title,
    String message,
    String positiveText,
    String negativeText,
  ) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop,
                child: Text(positiveText),
              ),
              const Gap(BuzzWireSizes.sm),
              TextButton(
                onPressed: () => Navigator.of(context).pop,
                child: Text(positiveText),
              ),
            ],
          );
        });
  }

  // Replace this with go Router call
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  static void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  // static void pushToScreen(BuildContext context, String path) {
  //   context.pushNamed(path);
  // }

  // static void goToScreen(BuildContext context, String path) {
  //   context.goNamed(path);
  // }
}
