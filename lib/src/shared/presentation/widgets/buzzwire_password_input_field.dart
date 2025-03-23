import 'package:flutter/material.dart';

class BuzzWirePasswordInputField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String hintText;
  final bool? enabled;

  const BuzzWirePasswordInputField({
    super.key,
    this.controller,
    this.textInputAction,
    this.onEditingComplete,
    this.onChanged,
    this.hintText = "Min. of 6 characters",
    this.validator,
    this.enabled,
    this.focusNode,
  });

  @override
  State<BuzzWirePasswordInputField> createState() =>
      _BuzzWirePasswordInputFieldState();
}

class _BuzzWirePasswordInputFieldState
    extends State<BuzzWirePasswordInputField> {
  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      controller: widget.controller,
      enabled: widget.enabled,
      textInputAction: widget.textInputAction,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: GestureDetector(
          onTap: _toggleObscureText,
          child: Icon(
            !_obscureText ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      onChanged: widget.onChanged,
      validator: widget.validator,
    );
  }
}
