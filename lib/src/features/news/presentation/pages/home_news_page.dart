import 'package:buzzwire/core/navigation/route.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/home_news_controller.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/home_news_state.dart';
import 'package:buzzwire/src/features/news/presentation/widgets/news_card.dart';
import 'package:buzzwire/src/shared/presentation/pagination/pagination_sliver_list_view.dart';
import 'package:buzzwire/src/shared/presentation/pagination/scroll_notification_handler.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_empty_or_error_screen.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeNewsPage extends ConsumerStatefulWidget {
  final String category;
  final bool Function() isActivePage;

  const HomeNewsPage(this.category, this.isActivePage, {super.key});

  @override
  ConsumerState<HomeNewsPage> createState() => _HomeNewsPageState();
}

class _HomeNewsPageState extends ConsumerState<HomeNewsPage> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(homeNewsControllerProvider(widget.category));
    return _buildBody(uiState);
  }

  Widget _buildBody(HomeNewsState uiState) {
    if (uiState.loadState is Empty) {
      return const SizedBox.shrink();
    }

    if (_isInitialLoading(uiState)) {
      return const BuzzWireProgressLoader();
    }

    if (_isInitialError(uiState)) {
      return BuzzWireEmptyOrErrorScreen.error(
        message: (uiState.loadState as Error).message,
        onPressed: () {
          ref
              .read(homeNewsControllerProvider(widget.category).notifier)
              .fetchNews(uiState.currentPage);
        },
      );
    }

    return ScrollNotificationHandler(
      loadMore: () {
        ref
            .read(homeNewsControllerProvider(widget.category).notifier)
            .fetchNews(uiState.currentPage + 1);
      },
      canLoadMoreData: () => canLoadMore(uiState),
      child: RefreshIndicator(
        displacement: 5,
        onRefresh: _fetchNews,
        child: CustomScrollView(
          slivers: buildSlivers(uiState),
        ),
      ),
    );
  }

  List<Widget> buildSlivers(HomeNewsState uiState) {
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

  Widget buildItem(ArticleEntity article) {
    return NewsCard(
        article: article,
        onClick: (article) {
          context.pushNamed(
            BuzzWireRoute.newsDetailScreen.name,
            extra: article,
          );
        },
        onSave: (article) => onSaveClick(article));
  }

  bool _isInitialLoading(HomeNewsState uiState) =>
      uiState.loadState is Loading && uiState.articles.isEmpty;

  bool _isInitialError(HomeNewsState uiState) =>
      uiState.loadState is Error && uiState.articles.isEmpty;

  bool canLoadMore(HomeNewsState uiState) {
    return uiState.currentPage < uiState.lastPage &&
        uiState.loadState is! Loading &&
        widget.isActivePage();
  }

  void _init() {
    Future.microtask(() {
      _fetchNews();
      ref
          .read(homeNewsControllerProvider(widget.category).notifier)
          .fetchSavedArticles();
    });
  }

  Future<void> _fetchNews() async {
    await ref
        .read(homeNewsControllerProvider(widget.category).notifier)
        .fetchNews(1);
  }

  Future<bool> onSaveClick(ArticleEntity article) async {
    final bool isBookmarking = article.isSaved;
    final bool result = isBookmarking
        ? await _bookmarkArticle(article)
        : await _unbookmarkArticle(article);

    final String message = _getBookmarkMessage(isBookmarking, result);

    if (mounted) {
      context.showSnackBar(message);
    }

    return result;
  }

  String _getBookmarkMessage(bool isBookmarking, bool result) {
    if (isBookmarking) {
      return result ? "Article bookmarked" : "Failed to bookmark";
    } else {
      return result ? "Article unbookmarked" : "Failed to remove unbookmark";
    }
  }

  Future<bool> _bookmarkArticle(ArticleEntity article) async {
    final result = await ref
        .read(homeNewsControllerProvider(widget.category).notifier)
        .bookmarkArticle(article);
    return result;
  }

  Future<bool> _unbookmarkArticle(ArticleEntity article) async {
    final result = await ref
        .read(homeNewsControllerProvider(widget.category).notifier)
        .unBookmarkArticle(article);
    return result;
  }
}
