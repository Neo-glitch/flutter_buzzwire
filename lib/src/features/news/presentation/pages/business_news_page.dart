import 'package:buzzwire/core/common/pagination/pagination_sliver_list_view.dart';
import 'package:buzzwire/core/common/pagination/scroll_notification_handler.dart';
import 'package:buzzwire/core/common/riverpod/load_state.dart';
import 'package:buzzwire/core/common/widgets/buzzwire_empty_or_error_screen.dart';
import 'package:buzzwire/core/common/widgets/buzzwire_progress_loader.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/category_news_controller.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/category_news_state.dart';
import 'package:buzzwire/src/features/news/presentation/screens/home_screen.dart';
import 'package:buzzwire/src/features/news/presentation/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class BusinessNewsPage extends ConsumerStatefulWidget {
  final String _category;
  final TabController tabController;
  const BusinessNewsPage(this._category, this.tabController, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BusinessNewsPageState();
}

class _BusinessNewsPageState extends ConsumerState<BusinessNewsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref
        .read(categoryNewsControllerProvider(widget._category).notifier)
        .fetchNews(1));
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(categoryNewsControllerProvider(widget._category));

    return ScrollNotificationHandler(
      loadMore: () {
        ref
            .read(categoryNewsControllerProvider(widget._category).notifier)
            .fetchNews(uiState.currentPage + 1);
      },
      canLoadMoreData: () => _canLoadMore(uiState),
      child: CustomScrollView(
        slivers: _buildSlivers(uiState),
      ),
    );
  }

  List<Widget> _buildSlivers(CategoryNewsState uiState) {
    // empty state
    if (uiState.loadState is Empty) {
      return [];
    }

    // Handle initial loading state
    if (_isInitialLoading(uiState)) {
      return [_buildInitialLoader()];
    }

    // Handle initial error state
    if (_isInitialError(uiState)) {
      return [_buildErrorScreen(uiState)];
    }

    // Default state: loaded content with optional pagination loader
    return [
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        sliver: PaginationSliverListView(
          separatorBuilder: (ctx, idx) => const Gap(15),
          canLoadMoreData: () => _canLoadMore(uiState),
          loadingWidget: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: BuzzWireProgressLoader(isInitialLoad: false),
          ),
          hasError: uiState.loadState is Error,
          itemCount: uiState.articles.length,
          itemBuilder: (ctx, idx) {
            return NewsCard(widget._category);
          },
        ),
      )
    ];
  }

  bool _isInitialLoading(CategoryNewsState uiState) =>
      uiState.loadState is Loading && uiState.currentPage <= 1;

  bool _isInitialError(CategoryNewsState uiState) =>
      uiState.loadState is Error && uiState.articles.isEmpty;

  Widget _buildInitialLoader() {
    return const SliverFillRemaining(
      child: BuzzWireProgressLoader(),
    );
  }

  Widget _buildErrorScreen(CategoryNewsState uiState) {
    return SliverToBoxAdapter(
      child: BuzzWireEmptyOrErrorScreen.error(
        message: (uiState.loadState as Error).message,
        onPressed: () {
          ref
              .read(categoryNewsControllerProvider(widget._category).notifier)
              .fetchNews(uiState.currentPage);
        },
      ),
    );
  }

  bool _canLoadMore(CategoryNewsState uiState) {
    return uiState.currentPage < uiState.lastPage &&
        uiState.loadState is! Loading &&
        widget.tabController.index == HomeScreenPage.business.pageIdx;
  }
}
