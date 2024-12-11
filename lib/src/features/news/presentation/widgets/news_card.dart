import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class NewsCard extends ConsumerWidget {
  final String news;
  const NewsCard(this.news, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageSection(),
          _buildNewsContentSection(context),
        ],
      ),
    );
  }

  Expanded _buildNewsContentSection(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "News $news",
              overflow: TextOverflow.ellipsis,
              style: context.bodySmall?.copyWith(fontSize: 10),
              maxLines: 1,
            ),
            const Gap(2),
            Text(
              "Chelsea confirm Silva out with knee ligament damage\nghghghgh",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: context.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Text(
              maxLines: 1,
              style: context.bodySmall?.copyWith(fontSize: 10),
              "Feb 28, 2023",
            )
          ],
        ),
      ),
    );
  }

  Expanded _buildImageSection() {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
            height: 120,
            fit: BoxFit.cover,
            imageUrl:
                "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/2GHBST6XYL4635DHJUZD3SXIZY.jpg&w=1440"),
      ),
    );
  }
}
