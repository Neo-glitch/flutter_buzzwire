import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewsHeadlineCard extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String time;

  const NewsHeadlineCard({
    required this.imageUrl,
    required this.category,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          _buildBackgroundImage(imageUrl),
          _buildOverlay(),
          _buildCategoryBadge(context, category),
          _buildHeadlineContent(context, time),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: CachedNetworkImage(
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
        imageUrl: imageUrl,
      ),
    );
  }

  Widget _buildOverlay() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  Widget _buildCategoryBadge(BuildContext context, String category) {
    return Positioned(
      top: 12,
      left: 16,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Text(
          category,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildHeadlineContent(BuildContext context, String time) {
    return Positioned(
      left: 16,
      right: 16,
      bottom: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "CNN Indonesia",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white),
              ),
              const Gap(5),
              Container(
                height: 4,
                width: 4,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              const Gap(5),
              Text(
                time,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Colors.white, fontSize: 8),
              ),
            ],
          ),
          const Gap(5),
          Text(
            "Alexandar wears modified helmet in road races",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
