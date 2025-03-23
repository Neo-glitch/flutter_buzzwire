import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuzzWireBottomSheetDragHandle extends StatelessWidget {
  final Function()? onClose;
  const BuzzWireBottomSheetDragHandle({super.key, this.onClose});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 32,
              height: 4,
              decoration: BoxDecoration(
                color: context.onSurfaceVariantColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          if (onClose != null)
            Positioned(
              right: 0,
              child: IconButton(
                iconSize: 20,
                padding: EdgeInsets.zero,
                onPressed: () {
                  onClose!();
                },
                icon: FaIcon(
                  FontAwesomeIcons.xmark,
                  color: context.onBackgroundColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
