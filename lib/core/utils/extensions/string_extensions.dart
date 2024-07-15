import 'package:buzzwire/core/constants/strings.dart';
import 'package:flutter/material.dart';

extension StringExtension on String {
  isValidEmail(String email) =>
      BuzzWireStrings.validEmailRegExp.hasMatch(email);

  isValidPassword(String password) =>
      BuzzWireStrings.validPasswordRegExp.hasMatch(password);
}
