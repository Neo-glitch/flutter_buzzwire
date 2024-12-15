import 'package:buzzwire/core/common/widgets/buzzwire_app_icon.dart';
import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const BuzzWireAppIcon(
        alignment: MainAxisAlignment.start,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: BuzzWireColors.grey, width: 1),
              color: context.surfaceColor,
              shape: BoxShape.circle,
            ),
            child: const FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              size: 14,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(16),
              child: CachedNetworkImage(
                placeholder: (context, url) {
                  // Todo: replace with reasonable place holder image
                  return const CircularProgressIndicator();
                },
                imageUrl:
                    "https://pixlr.com/images/generator/photo-generator.webp",
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
