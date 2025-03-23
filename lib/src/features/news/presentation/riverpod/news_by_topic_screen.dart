import 'package:buzzwire/core/navigation/route.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/news_by_topic_controller.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/news_by_topic_state.dart';
import 'package:buzzwire/src/features/news/presentation/widgets/news_card.dart';
import 'package:buzzwire/src/shared/presentation/pagination/pagination_list_view.dart';
import 'package:buzzwire/src/shared/presentation/pagination/scroll_notification_handler.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_empty_or_error_screen.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class NewsByTopicScreen extends ConsumerStatefulWidget {
  final String topic;
  const NewsByTopicScreen({
    super.key,
    required this.topic,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewsByTopicScreenState();
}

class _NewsByTopicScreenState extends ConsumerState<NewsByTopicScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(child: _buildBody()),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return BuzzWireAppBar(
      title: Text(
        widget.topic,
        style: context.titleLarge?.copyWith(fontSize: 20),
      ),
    );
  }

  void _init() {
    Future.microtask(() {
      _fechNews();
      ref.read(newsByTopicControllerProvider.notifier).fetchSavedArticles();
    });
  }

  Future<void> _fechNews() async {
    await ref
        .read(newsByTopicControllerProvider.notifier)
        .fetchNews(1, widget.topic);
  }

  Widget _buildBody() {
    final uiState = ref.watch(newsByTopicControllerProvider);

    if (uiState.loadState is Empty) {
      return const SizedBox.shrink();
    }

    if (uiState.loadState is Loading && uiState.articles.isEmpty) {
      return const BuzzWireProgressLoader();
    }

    if (uiState.loadState is Error && uiState.articles.isEmpty) {
      return BuzzWireEmptyOrErrorScreen.error(
        message: (uiState.loadState as Error).message,
        onPressed: () => ref
            .read(newsByTopicControllerProvider.notifier)
            .fetchNews(1, widget.topic),
      );
    }

    return ScrollNotificationHandler(
      loadMore: () => _loadMore(uiState),
      canLoadMoreData: () => _canLoadMore(uiState),
      child: RefreshIndicator(
          onRefresh: _fechNews, child: _buildNewsList(uiState)),
    );
  }

  bool _canLoadMore(NewsByTopicState uiState) =>
      uiState.currentPage < uiState.lastPage && uiState.loadState is! Loading;

  void _loadMore(NewsByTopicState uiState) => ref
      .read(newsByTopicControllerProvider.notifier)
      .fetchNews(uiState.currentPage + 1, widget.topic);

  Widget _buildNewsList(NewsByTopicState uiState) {
    return PaginationListView(
      canLoadMoreData: () => _canLoadMore(uiState),
      loadingWidget: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: BuzzWireProgressLoader(isInitialLoad: false),
      ),
      hasError: uiState.loadState is Error,
      itemCount: uiState.articles.length,
      separatorBuilder: (ctx, idx) => const Gap(15),
      itemBuilder: (ctx, idx) {
        final article = uiState.articles[idx];
        return NewsCard(
          article: article,
          onClick: (article) => context
              .pushNamed(BuzzWireRoute.newsDetailScreen.name, extra: article),
          onSave: _onSaveClick,
        );
      },
    );
  }

  Future<bool> _onSaveClick(ArticleEntity article) async {
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
        .read(newsByTopicControllerProvider.notifier)
        .bookmarkArticle(article);
    return result;
  }

  Future<bool> _unbookmarkArticle(ArticleEntity article) async {
    final result = await ref
        .read(newsByTopicControllerProvider.notifier)
        .unBookmarkArticle(article);
    return result;
  }
}
