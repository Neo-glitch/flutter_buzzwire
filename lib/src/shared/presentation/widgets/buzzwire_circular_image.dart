import 'dart:io';

import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/utils/extensions/num_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuzzWireCircularImage extends StatelessWidget {
  final double radius;
  final String? imageUrl;
  final String? imagePath;
  final Color? borderColor;
  final double? borderWidth;
  const BuzzWireCircularImage({
    super.key,
    required this.radius,
    this.imageUrl,
    this.imagePath,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(borderWidth.orZero),
      decoration: BoxDecoration(color: borderColor, shape: BoxShape.circle),
      child: ClipOval(
        child: SizedBox.fromSize(
            size: Size.fromRadius(radius), child: _buildImage()),
      ),
    );
  }

  Widget _buildImage() {
    if (imageUrl != null) {
      return CachedNetworkImage(
        placeholder: (context, url) {
          return const Center(child: FaIcon(FontAwesomeIcons.solidUser));
        },
        errorWidget: (context, url, error) {
          return _buildPlaceHolderImage();
        },
        imageUrl: imageUrl!,
      );
    }

    if (imagePath != null) {
      return Image.file(
        File(imagePath!),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceHolderImage();
        },
      );
    }

    return _buildPlaceHolderImage();
  }

  Widget _buildPlaceHolderImage() => Center(
        child: SizedBox.expand(
          child: Container(
            color: BuzzWireColors.grey.withOpacity(0.7),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.solidUser,
                size: radius,
              ),
            ),
          ),
        ),
      );
}
