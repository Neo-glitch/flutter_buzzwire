import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/utils/extensions/bool_extension.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class BuzzWireSearchBar extends StatefulWidget {
  final void Function(String)? onSearch;
  final void Function()? onClear;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final TextEditingController? searchController;
  final String hintText;

  const BuzzWireSearchBar({
    super.key,
    this.onSearch,
    this.onClear,
    this.onTap,
    required this.hintText,
    this.onEditingComplete,
    this.searchController,
  });

  @override
  State<BuzzWireSearchBar> createState() => _BuzzWireSearchBarState();
}

class _BuzzWireSearchBarState extends State<BuzzWireSearchBar> {
  bool get _shouldEnableTextField =>
      widget.onSearch != null && widget.onTap == null;

  bool get _shouldShowClearButton =>
      widget.onClear != null &&
      widget.onTap == null &&
      widget.searchController?.text.isNotEmpty.orFalse == true;

  void _handleSearchInputChange(String value) {
    if (widget.onSearch != null) {
      widget.onSearch!(value);
      setState(() {});
    }
  }

  void _handleClearButtonPressed() {
    widget.onClear?.call();
    widget.searchController?.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          color: Color.lerp(context.surfaceColor, Colors.black12, 0.12),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child: Row(
          children: [
            _buildSearchIcon(context),
            const Gap(15),
            _buildTextField(context),
            if (_shouldShowClearButton) _buildClearButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchIcon(BuildContext context) {
    return FaIcon(
      FontAwesomeIcons.magnifyingGlass,
      size: 14,
      color: context.onBackgroundColor.withOpacity(0.5),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Expanded(
      child: TextField(
        enabled: _shouldEnableTextField,
        autofocus: _shouldEnableTextField,
        maxLines: 1,
        style: context.bodyMedium?.copyWith(fontSize: 14),
        controller: widget.searchController,
        onChanged: _handleSearchInputChange,
        onEditingComplete: widget.onEditingComplete,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintStyle: context.bodySmall?.copyWith(fontSize: 14),
          hintText: widget.hintText,
          filled: false,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }

  Widget _buildClearButton() {
    return IconButton(
      iconSize: 18,
      onPressed: _handleClearButtonPressed,
      icon: const FaIcon(
        FontAwesomeIcons.solidCircleXmark,
        color: BuzzWireColors.grey,
      ),
    );
  }
}
