import 'package:buzzwire/core/navigation/route.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/discover_news_controller.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/discover_news_state.dart';
import 'package:buzzwire/src/features/news/presentation/widgets/news_headline.dart';
import 'package:buzzwire/src/features/news/presentation/widgets/trending_news_list.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_empty_or_error_screen.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_loader.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class DiscoverScreen extends ConsumerStatefulWidget {
  const DiscoverScreen({super.key});

  @override
  ConsumerState<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends ConsumerState<DiscoverScreen> {
  late List<String> trendingNewsTopics;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    Future.microtask(() {
      ref.read(discoverNewsControllerProvider.notifier).fetchItems();
    });
    trendingNewsTopics =
        ref.read(discoverNewsControllerProvider.notifier).trendingNewsTopics;
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(discoverNewsControllerProvider);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: RefreshIndicator(
            displacement: 0,
            onRefresh: () async {
              await ref
                  .read(discoverNewsControllerProvider.notifier)
                  .fetchItems();
            },
            child: Column(
              children: [
                _buildSearchBar(),
                _buildBody(uiState),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(DiscoverNewsState uiState) {
    if (uiState.loadState is Empty) {
      return const SizedBox.shrink();
    }

    if (uiState.loadState is Loading && _areAllItemsEmpty(uiState)) {
      return const Expanded(child: BuzzWireProgressLoader());
    }

    if (uiState.loadState is Error) {
      final message = (uiState.loadState as Error).message;
      return Expanded(
        child: BuzzWireEmptyOrErrorScreen.error(
          message: message,
          onPressed: () {
            ref.read(discoverNewsControllerProvider.notifier).fetchItems();
          },
        ),
      );
    }

    return Expanded(
      child: ListView(
        padding: const EdgeInsets.only(bottom: 30),
        children: [
          if (uiState.breakingNewsItems.isNotEmpty)
            _buildBreakingNewsSection(uiState.breakingNewsItems),
          if (uiState.firstTrendingNewsList.isNotEmpty)
            _buildTrendingNewsSection(
              context,
              trendingNewsTopics[0],
              uiState.firstTrendingNewsList,
            ),
          if (uiState.secondTrendingNewsList.isNotEmpty)
            _buildTrendingNewsSection(
              context,
              trendingNewsTopics[1],
              uiState.secondTrendingNewsList,
            ),
          if (uiState.thirdTrendingNewsList.isNotEmpty)
            _buildTrendingNewsSection(
              context,
              trendingNewsTopics[2],
              uiState.thirdTrendingNewsList,
            ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: BuzzWireSearchBar(
        onTap: () {
          context.pushNamed(BuzzWireRoute.searchNews.name);
        },
        hintText: "What are you looking for today?",
      ),
    );
  }

  Column _buildTrendingNewsSection(
    BuildContext context,
    String topic,
    List<ArticleEntity> articles,
  ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: _buildTrendingNewsSectionHeader(topic),
        ),
        const Gap(10),
        Container(
          height: 210,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TrendingNewsList(
            itemWidth: 200,
            articles: articles,
            onItemClick: (article) {
              _navToNewsDetailsScreen(article);
            },
          ),
        ),
      ],
    );
  }

  Row _buildTrendingNewsSectionHeader(String topic) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          topic,
          style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
        ),
        GestureDetector(
          onTap: () => _navToNewsByTopicScreen(topic),
          child: Text(
            "View all",
            style: context.bodyMedium?.copyWith(fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildBreakingNewsSection(
    List<ArticleEntity> breakingNewsItems,
  ) {
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
          NewsHeadline(
            articles: breakingNewsItems,
            onItemClick: (articleEntity) {
              _navToNewsDetailsScreen(articleEntity);
            },
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return BuzzWireAppBar(
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
          ),
        ],
      ),
    );
  }

  void _navToNewsDetailsScreen(ArticleEntity article) {
    context.pushNamed(BuzzWireRoute.newsDetails.name, extra: article);
  }

  void _navToNewsByTopicScreen(String topic) {
    context.pushNamed(BuzzWireRoute.newsByTopic.name, extra: topic);
  }

  bool _areAllItemsEmpty(DiscoverNewsState uiState) {
    return uiState.breakingNewsItems.isEmpty &&
        uiState.firstTrendingNewsList.isEmpty &&
        uiState.secondTrendingNewsList.isEmpty &&
        uiState.thirdTrendingNewsList.isEmpty;
  }
}
