import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_image_card.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/core/utils/helpers/date_helper_functions.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TrendingNewsCard extends StatelessWidget {
  final double width;
  final double? placeHolderSize;
  final ArticleEntity article;

  const TrendingNewsCard({
    super.key,
    required this.width,
    this.placeHolderSize,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: BuzzWireImageCard(
              radius: 6,
              width: double.infinity,
              placeHoldersSize: placeHolderSize,
              // height: constraint.maxHeight * 0.55,
              imageUrl: article.image.orEmpty,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(2),
                Text(
                  article.title.orEmpty,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: context.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  softWrap: true,
                ),
                const Gap(2),
                Text(
                  BuzzWireDateHelperFunctions.formatTimeAgo(
                      article.publishedAt.orEmpty),
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
