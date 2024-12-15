import 'package:buzzwire/core/constants/strings.dart';
import 'package:flutter/material.dart';

extension StringExtension on String {
  isValidEmail() => BuzzWireStrings.validEmailRegExp.hasMatch(this);
  isValidPassword() => BuzzWireStrings.validPasswordRegExp.hasMatch(this);
  String get toCapitalized =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String get toTitleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized)
      .join(' ');
}
