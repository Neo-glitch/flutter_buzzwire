import 'package:buzzwire/core/constants/strings.dart';
import 'package:flutter/material.dart';

extension StringExtension on String {
  isValidEmail() => BuzzWireStrings.validEmailRegExp.hasMatch(this);
  isValidPassword() => BuzzWireStrings.validPasswordRegExp.hasMatch(this);
}
