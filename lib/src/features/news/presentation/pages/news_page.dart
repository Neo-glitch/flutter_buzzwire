import 'package:buzzwire/core/common/pagination/pagination_sliver_list_view.dart';
import 'package:buzzwire/core/common/pagination/scroll_notification_handler.dart';
import 'package:buzzwire/core/common/riverpod/load_state.dart';
import 'package:buzzwire/core/common/widgets/buzzwire_empty_or_error_screen.dart';
import 'package:buzzwire/core/common/widgets/buzzwire_progress_loader.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/category_news_controller.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/category_news_state.dart';
import 'package:buzzwire/src/features/news/presentation/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class NewsPage extends ConsumerStatefulWidget {
  final String category;
  final bool Function() isActivePage;

  const NewsPage(this.category, this.isActivePage, {super.key});

  @override
  ConsumerState<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState<BaseNewsPage> extends ConsumerState<NewsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(categoryNewsControllerProvider(widget.category).notifier)
          .fetchNews(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(categoryNewsControllerProvider(widget.category));

    return ScrollNotificationHandler(
      loadMore: () {
        ref
            .read(categoryNewsControllerProvider(widget.category).notifier)
            .fetchNews(uiState.currentPage + 1);
      },
      canLoadMoreData: () => canLoadMore(uiState),
      child: CustomScrollView(
        slivers: buildSlivers(uiState),
      ),
    );
  }

  List<Widget> buildSlivers(CategoryNewsState uiState) {
    if (uiState.loadState is Empty) {
      return [];
    }

    if (isInitialLoading(uiState)) {
      return [buildInitialLoader()];
    }

    if (isInitialError(uiState)) {
      return [buildErrorScreen(uiState)];
    }

    return [
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        sliver: PaginationSliverListView(
          separatorBuilder: (ctx, idx) => const Gap(15),
          canLoadMoreData: () => canLoadMore(uiState),
          loadingWidget: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: BuzzWireProgressLoader(isInitialLoad: false),
          ),
          emptyWidget: BuzzWireEmptyOrErrorScreen.empty(
            header: "No Articles Found",
            message:
                "It seems there are currently no articles available in the ${widget.category} category. Please check back later or explore other categories.",
          ),
          hasError: uiState.loadState is Error,
          itemCount: uiState.articles.length,
          itemBuilder: (ctx, idx) => buildItem(uiState.articles[idx]),
        ),
      )
    ];
  }

  Widget buildItem(ArticleEntity? article) {
    return NewsCard(widget.category, article: article);
  }

  bool isInitialLoading(CategoryNewsState uiState) =>
      uiState.loadState is Loading && uiState.currentPage <= 1;

  bool isInitialError(CategoryNewsState uiState) =>
      uiState.loadState is Error && uiState.articles.isEmpty;

  Widget buildInitialLoader() {
    return const SliverFillRemaining(
      child: BuzzWireProgressLoader(),
    );
  }

  Widget buildErrorScreen(CategoryNewsState uiState) {
    return SliverFillRemaining(
      child: BuzzWireEmptyOrErrorScreen.error(
        message: (uiState.loadState as Error).message,
        onPressed: () {
          ref
              .read(categoryNewsControllerProvider(widget.category).notifier)
              .fetchNews(uiState.currentPage);
        },
      ),
    );
  }

  bool canLoadMore(CategoryNewsState uiState) {
    return uiState.currentPage < uiState.lastPage &&
        uiState.loadState is! Loading &&
        widget.isActivePage();
  }
}
