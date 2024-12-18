import 'package:buzzwire/src/features/news/presentation/widgets/trending_news_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TrendingNewsList extends StatelessWidget {
  final double itemWidth;
  const TrendingNewsList({super.key, required this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, idx) {
        return TrendingNewsCard(width: itemWidth);
      },
      clipBehavior: Clip.none,
      separatorBuilder: (ctx, idx) => const Gap(10),
      itemCount: 15,
    );
  }
}
