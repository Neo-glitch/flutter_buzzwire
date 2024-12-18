import 'package:buzzwire/src/features/news/presentation/widgets/news_headline_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewsHeadline extends ConsumerStatefulWidget {
  const NewsHeadline({super.key});

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
      itemCount: 5,
      itemBuilder: (ctx, itemIdx, pageViewIdx) {
        return const NewsHeadlineCard(
          imageUrl: "https://pixlr.com/images/generator/photo-generator.webp",
          category: "Sports",
          time: "Today",
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
      count: 5,
      effect: ExpandingDotsEffect(
        dotWidth: 8,
        dotHeight: 3,
        activeDotColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
