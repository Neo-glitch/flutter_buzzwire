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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          color: Color.lerp(context.backgroundColor, Colors.black12, 0.12),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child: Row(
          children: [
            FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              size: 14,
              color: context.onBackgroundColor.withOpacity(0.5),
            ),
            const Gap(15),
            Expanded(
              child: TextField(
                enabled: widget.onSearch != null && widget.onTap == null,
                autofocus: widget.onSearch != null && widget.onTap == null,
                maxLines: 1,
                style: context.bodyMedium?.copyWith(fontSize: 14),
                controller: widget.searchController,
                onChanged: (value) {
                  if (widget.onSearch != null) {
                    widget.onSearch!(value);
                    setState(() {});
                  }
                },
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
            ),
            if (widget.onClear != null &&
                widget.onTap == null &&
                widget.searchController?.text.isNotEmpty.orFalse == true)
              IconButton(
                iconSize: 18,
                onPressed: () {
                  if (widget.onClear != null) {
                    widget.onClear!();
                    widget.searchController?.clear();
                    setState(() {});
                  }
                },
                icon: const FaIcon(
                  FontAwesomeIcons.solidCircleXmark,
                  color: BuzzWireColors.grey,
                ),
              )
          ],
        ),
      ),
    );
  }
}
