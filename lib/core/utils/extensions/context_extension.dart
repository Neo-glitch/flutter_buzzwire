import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/constants/sizes.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_simple_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  Color get surfaceVariantColor => Theme.of(this).colorScheme.surfaceVariant;
  Color get onSurfaceVariantColor =>
      Theme.of(this).colorScheme.onSurfaceVariant;

  // can other functions like showing a toast and all, show bottom sheet
  void showSnackBar(
    String message, {
    Function()? action,
  }) {
    HapticFeedback.mediumImpact();
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: BuzzWireColors.darkerGrey,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
          showCloseIcon: true,
          dismissDirection: DismissDirection.horizontal,
          closeIconColor: secondaryColor,
          content: Text(
            message,
            style: bodyMedium?.copyWith(color: Colors.white),
          ),
          action: action != null
              ? SnackBarAction(
                  textColor: secondaryColor,
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
    String message, {
    String? buttonText,
    Function()? onClick,
  }) {
    return showGeneralDialog(
      context: this,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
      pageBuilder: (ctx, anim1, anim2) {
        return BuzzWireSimpleDialog(
          title: title,
          description: message,
          primaryButtonText: buttonText,
          onPrimaryClick: () {
            ctx.pop();
            if (onClick != null) onClick();
          },
        );
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: anim1,
            curve: Curves.elasticOut,
            reverseCurve: Curves.easeOutCubic,
          ),
          child: child,
        );
      },
    );
  }

  Future<T?> showDoubleButtonAlert(
    String title,
    String message,
    String primaryButtonText,
    String secondaryButtonText, {
    Function()? onPrimaryButtonClick,
    Function()? onSecondaryButtonClick,
  }) {
    return showGeneralDialog(
      context: this,
      barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
      barrierDismissible: true,
      pageBuilder: (ctx, anim1, anim2) {
        return BuzzWireSimpleDialog(
          title: title,
          description: message,
          primaryButtonText: primaryButtonText,
          secondaryButtonText: secondaryButtonText,
          onPrimaryClick: () {
            ctx.pop();
            if (onPrimaryButtonClick != null) onPrimaryButtonClick();
          },
          onSecondaryClick: () {
            ctx.pop();
            if (onSecondaryButtonClick != null) onSecondaryButtonClick();
          },
        );
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: anim1,
            curve: Curves.elasticOut,
            reverseCurve: Curves.easeOutCubic,
          ),
          child: child,
        );
      },
    );
  }

  Future<T?> showFullScreenDialog({required Widget dialog}) {
    return showGeneralDialog(
      context: this,
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (ctx, anim1, anim2) {
        return dialog;
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        const begin = Offset(0.0, 1.0); // Start from the bottom
        const end = Offset.zero; // End at top
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = anim1.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
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
