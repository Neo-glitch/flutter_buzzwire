import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class BuzzWireSearchBar extends StatefulWidget {
  final void Function(String)? onSearch;
  final void Function()? onClear;
  final void Function()? onTap;
  final String hintText;

  const BuzzWireSearchBar({
    super.key,
    this.onSearch,
    this.onClear,
    this.onTap,
    required this.hintText,
  });

  @override
  State<BuzzWireSearchBar> createState() => _BuzzWireSearchBarState();
}

class _BuzzWireSearchBarState extends State<BuzzWireSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 15, top: 2, bottom: 2),
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
                maxLines: 1,
                style: context.bodySmall?.copyWith(fontSize: 14),
                controller: _searchController,
                onChanged: (value) {
                  if (widget.onSearch != null) {
                    widget.onSearch!(value);
                    setState(() {});
                  }
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
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
                _searchController.text.isNotEmpty)
              IconButton(
                iconSize: 18,
                onPressed: () {
                  if (widget.onClear != null) {
                    widget.onClear!();
                    _searchController.clear();
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
