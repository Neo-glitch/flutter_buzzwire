import 'package:buzzwire/core/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BuzzWireImageCard extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final double? placeHoldersSize;
  final double radius;

  const BuzzWireImageCard({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.placeHoldersSize,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        fadeOutDuration: const Duration(milliseconds: 300),
        fadeInDuration: const Duration(milliseconds: 300),
        placeholder: (context, url) {
          return Icon(
            color: BuzzWireColors.darkGrey,
            Icons.image,
            size: placeHoldersSize,
          );
        },
        errorWidget: (context, url, error) {
          return Icon(
            color: BuzzWireColors.darkGrey,
            Icons.broken_image,
            size: placeHoldersSize,
          );
        },
        height: height,
        width: width,
        fit: BoxFit.cover,
        imageUrl: imageUrl,
      ),
    );
  }
}
