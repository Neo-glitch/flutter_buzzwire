import 'package:buzzwire/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension ContextExtension<T> on BuildContext {
  // Text Styles
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;
  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;
  TextStyle? get titleTextStyle => Theme.of(this).appBarTheme.titleTextStyle;

  // Colors
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get onPrimaryColor => Theme.of(this).colorScheme.onPrimary;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get onSecondaryColor => Theme.of(this).colorScheme.onSecondary;
  Color get tertiaryColor => Theme.of(this).colorScheme.tertiary;
  Color get onTeriaryColor => Theme.of(this).colorScheme.onTertiary;
  Color get errorColor => Theme.of(this).colorScheme.error;
  Color get onErrorColor => Theme.of(this).colorScheme.onError;
  Color get backgroundColor => Theme.of(this).colorScheme.background;
  Color get onBackgroundColor => Theme.of(this).colorScheme.onBackground;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get onSurfaceColor => Theme.of(this).colorScheme.onSurface;

  // can other functions like showing a toast and all, show bottom sheet
  void showSnackBar(
    String message, {
    Function()? action,
  }) {
    ScaffoldMessenger.of(this)
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

  Future<T?> showSingleButtonAlert(
    String title,
    String message,
  ) {
    return showDialog(
        context: this,
        builder: (ctx) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(this).pop(),
                child: const Text("Ok"),
              )
            ],
          );
        });
  }

  Future<T?> showDoubleButtonAlert(
    String title,
    String message,
    String positiveText,
    String negativeText, {
    Function()? positiveAction,
    Function()? negativeAction,
  }) {
    return showDialog(
        context: this,
        builder: (ctx) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(this).pop();
                  if (positiveAction != null) positiveAction();
                },
                child: Text(positiveText),
              ),
              const Gap(BuzzWireSizes.sm),
              TextButton(
                onPressed: () {
                  Navigator.of(this).pop();
                  if (negativeAction != null) negativeAction();
                },
                child: Text(positiveText),
              ),
            ],
          );
        });
  }

  Future<bool?> showToast(String message,
      [Toast toastLength = Toast.LENGTH_SHORT]) {
// It's a plugin to show toast and we can with extension
    Fluttertoast.cancel();
    return Fluttertoast.showToast(
        msg: message,
        toastLength: toastLength,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: secondaryColor,
        textColor: onSecondaryColor,
        fontSize: labelMedium?.fontSize ?? 14);
  }

  // Replace this with go Router call
  void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(this, MaterialPageRoute(builder: (_) => screen));
  }
}
