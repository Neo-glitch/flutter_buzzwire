import 'package:flutter/material.dart';

class BuzzWireEmailInputField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final String hintText;
  final bool? enabled;

  const BuzzWireEmailInputField({
    super.key,
    this.focusNode,
    this.controller,
    this.textInputAction,
    this.onEditingComplete,
    this.onChanged,
    this.validator,
    this.hintText = "Enter email",
    this.enabled,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      enabled: enabled,
      textInputAction: textInputAction,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(hintText: hintText, suffixIcon: suffixIcon),
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
    );
  }
}
