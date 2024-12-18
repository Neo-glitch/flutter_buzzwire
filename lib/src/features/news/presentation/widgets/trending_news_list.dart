import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/presentation/widgets/trending_news_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TrendingNewsList extends StatelessWidget {
  final double itemWidth;
  final List<ArticleEntity> articles;
  final void Function(ArticleEntity) onItemClick;

  const TrendingNewsList({
    super.key,
    required this.itemWidth,
    required this.articles,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, idx) {
        final article = articles[idx];
        return GestureDetector(
          onTap: () {
            onItemClick(article);
          },
          child: TrendingNewsCard(
            width: itemWidth,
            article: article,
          ),
        );
      },
      clipBehavior: Clip.none,
      separatorBuilder: (ctx, idx) => const Gap(10),
      itemCount: articles.length,
    );
  }
}
