import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_image_card.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/core/utils/helpers/date_helper_functions.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewsHeadlineCard extends StatelessWidget {
  final ArticleEntity article;

  const NewsHeadlineCard({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          _buildBackgroundImage(article.image.orEmpty),
          _buildOverlay(),
          _buildHeadlineContent(
            context,
            article.source?.name,
            article.description,
            article.publishedAt,
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage(String imageUrl) {
    return BuzzWireImageCard(
      imageUrl: imageUrl,
      height: 200,
      width: double.infinity,
      radius: 6,
      placeHoldersSize: 160,
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

  Widget _buildHeadlineContent(
    BuildContext context,
    String? source,
    String? description,
    String? publishedAt,
  ) {
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
                source.orEmpty,
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
                BuzzWireDateHelperFunctions.formatTimeAgo(publishedAt.orEmpty),
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Colors.white, fontSize: 8),
              ),
            ],
          ),
          const Gap(5),
          Text(
            article.title.orEmpty,
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
