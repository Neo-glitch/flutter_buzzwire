import 'dart:io';

import 'package:buzzwire/core/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BuzzWireImageCard extends StatelessWidget {
  final String? imageUrl;
  final String? imagePath;
  final String? imageAssetPath;
  final double? height;
  final double? width;
  final double? placeHoldersSize;
  final double radius;

  const BuzzWireImageCard({
    super.key,
    this.imageUrl,
    this.imagePath,
    this.imageAssetPath,
    this.height,
    this.width,
    this.placeHoldersSize,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius), child: _buildImage());
  }

  Widget _buildImage() {
    if (imageUrl != null) {
      return _buildImageFromImageUrl();
    }

    if (imagePath != null) {
      return _buildImageFromImagePath();
    }

    if (imageAssetPath != null) {
      return _buildImageFromImageAssetPath();
    }

    return Icon(
      color: BuzzWireColors.darkGrey,
      Icons.image,
      size: placeHoldersSize,
    );
  }

  Widget _buildImageFromImageAssetPath() {
    return Image.asset(
      imageAssetPath!,
      fit: BoxFit.cover,
      height: height,
      width: width,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          color: BuzzWireColors.darkGrey,
          Icons.broken_image,
          size: placeHoldersSize,
        );
      },
    );
  }

  Image _buildImageFromImagePath() {
    return Image.file(
      File(imagePath!),
      fit: BoxFit.cover,
      height: height,
      width: width,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          color: BuzzWireColors.darkGrey,
          Icons.broken_image,
          size: placeHoldersSize,
        );
      },
    );
  }

  Widget _buildImageFromImageUrl() {
    return CachedNetworkImage(
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
      imageUrl: imageUrl!,
    );
  }
}
