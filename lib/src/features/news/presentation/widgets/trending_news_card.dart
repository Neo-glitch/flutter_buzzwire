import 'package:buzzwire/core/common/widgets/buzzwire_image_card.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TrendingNewsCard extends StatelessWidget {
  final double width;
  const TrendingNewsCard({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: BuzzWireImageCard(
              radius: 6,
              width: double.infinity,
              // height: constraint.maxHeight * 0.55,
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt2WjE3TlnoHHKhrUCzcHiyHZdmE2UUE0VDg&s",
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(2),
                Text(
                  "Please stop joking around and get fit\nfffg",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: context.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  softWrap: true,
                ),
                Gap(2),
                Text(
                  "Feb 14, 2024",
                  style: context.bodySmall,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
