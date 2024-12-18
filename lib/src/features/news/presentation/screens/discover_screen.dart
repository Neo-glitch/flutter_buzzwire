import 'package:buzzwire/core/common/widgets/buzzwire_image_card.dart';
import 'package:buzzwire/core/common/widgets/buzzwire_search_bar.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/news/presentation/widgets/news_headline.dart';
import 'package:buzzwire/src/features/news/presentation/widgets/trending_news_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class DiscoverScreen extends ConsumerWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              _buildBreakingNewsSection(context),
              _buildTrendingNewsSection(context, "Politics"),
              _buildTrendingNewsSection(context, "Music"),
              _buildTrendingNewsSection(context, "Blockchain"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: BuzzWireSearchBar(
        onTap: () {
          //todo nav to search screen
        },
        hintText: "What are you looking for today?",
      ),
    );
  }

  Column _buildTrendingNewsSection(BuildContext context, String category) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: _buildTrendingNewsSectionHeader(context, category),
        ),
        Gap(10),
        Container(
            height: 210,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const TrendingNewsList(itemWidth: 200)),
      ],
    );
  }

  Row _buildTrendingNewsSectionHeader(BuildContext context, String category) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          category,
          style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
        ),
        GestureDetector(
          onTap: () {
            // todo go to view all screen for this category
          },
          child: Text("View all",
              style: context.bodyMedium?.copyWith(fontSize: 12)),
        ),
      ],
    );
  }

  Widget _buildBreakingNewsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 14,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Breaking News",
              style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          const Gap(14),
          const NewsHeadline(),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Discover",
            style: context.titleLarge?.copyWith(fontSize: 20),
          ),
          Text(
            "News from around the world",
            style: context.bodySmall,
          )
        ],
      ),
    );
  }
}
