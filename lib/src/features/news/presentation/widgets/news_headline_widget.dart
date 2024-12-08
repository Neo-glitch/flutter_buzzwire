import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NewsHeadlineWidget extends ConsumerWidget {
  // int carouselIndex = 0;

  const NewsHeadlineWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (ctx, itemIdx, pageViewIdx) {
        return Container();
      },
      options: CarouselOptions(
          height: 220,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(seconds: 1),
          onPageChanged: (idx, reason) {}),
    );
  }

  // Widget _buildNewsHealineImage(String imageUrl, String category, String) {}
}

class NewsHeadlineItemWidget extends ConsumerWidget {
  const NewsHeadlineItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: CachedNetworkImage(
              height: 200,
              width: 400,
              fit: BoxFit.cover,
              imageUrl:
                  "https://pixlr.com/images/generator/photo-generator.webp"),
        ),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        Positioned(
          top: 12,
          left: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
            decoration: BoxDecoration(
              color: context.primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.center,
            child: Text(
              "Hello",
              style: context.labelMedium?.copyWith(color: Colors.white),
            ),
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 8,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    maxLines: 1,
                    "CNN Indonesia",
                    style: context.bodyMedium?.copyWith(color: Colors.white),
                  ),
                  const Gap(5),
                  Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                  const Gap(5),
                  Text(
                    maxLines: 1,
                    "6 hours ago",
                    style: context.labelSmall
                        ?.copyWith(color: Colors.white, fontSize: 8),
                  ),
                ],
              ),
              const Gap(5),
              Text(
                style: context.titleSmall?.copyWith(color: Colors.white),
                "Alexandar wears modified helmet in road races",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        )
      ],
    );
  }
}
