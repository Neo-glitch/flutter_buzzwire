import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/presentation/widgets/news_headline_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewsHeadline extends ConsumerStatefulWidget {
  final List<ArticleEntity> articles;
  final void Function(ArticleEntity articleEntity) onItemClick;
  const NewsHeadline({
    super.key,
    required this.articles,
    required this.onItemClick,
  });

  @override
  ConsumerState<NewsHeadline> createState() => _NewsHeadlineState();
}

class _NewsHeadlineState extends ConsumerState<NewsHeadline> {
  int _carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCarousel(),
        const Gap(8),
        Center(child: _buildIndicator(context)),
      ],
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider.builder(
      itemCount: widget.articles.length,
      itemBuilder: (ctx, itemIdx, pageViewIdx) {
        final article = widget.articles[itemIdx];
        return GestureDetector(
          onTap: () {
            widget.onItemClick(article);
          },
          child: NewsHeadlineCard(
            article: article,
          ),
        );
      },
      options: CarouselOptions(
        height: 200,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        onPageChanged: (idx, reason) {
          setState(() {
            _carouselIndex = idx;
          });
        },
      ),
    );
  }

  Widget _buildIndicator(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: _carouselIndex,
      count: widget.articles.length,
      effect: ExpandingDotsEffect(
        dotWidth: 8,
        dotHeight: 3,
        activeDotColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
