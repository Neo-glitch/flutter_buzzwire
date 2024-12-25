import 'package:buzzwire/core/navigation/route.dart';
import 'package:buzzwire/core/utils/helpers/debouncer.dart';
import 'package:buzzwire/core/utils/helpers/helper_functions.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/search_news_controller.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/search_news_event.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/search_news_state.dart';
import 'package:buzzwire/src/features/news/presentation/widgets/news_card.dart';
import 'package:buzzwire/src/features/search_history/domain/entity/search_history_entity.dart';
import 'package:buzzwire/src/features/search_history/presentation/widget/search_history_list.dart';
import 'package:buzzwire/src/shared/presentation/pagination/pagination_list_view.dart';
import 'package:buzzwire/src/shared/presentation/pagination/scroll_notification_handler.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_empty_or_error_screen.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_loader.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SearchNewsScreen extends ConsumerStatefulWidget {
  const SearchNewsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchNewsScreenState();
}

class _SearchNewsScreenState extends ConsumerState<SearchNewsScreen> {
  final _searchController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      init();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(searchNewsControllerProvider);
    return SafeArea(
      child: Scaffold(
        appBar: BuzzWireAppBar(
          title: BuzzWireSearchBar(
            searchController: _searchController,
            hintText: "Search...",
            onSearch: (value) {
              if (value.isNotEmpty) {
                _debouncer.run(() {
                  _searchNews(value);
                });
              } else {
                _debouncer.cancel();
                _resetLoadState();
              }
            },
            onClear: () {
              _debouncer.cancel();
              _resetLoadState();
            },
            onEditingComplete: () {
              if (_searchController.text.isNotEmpty) {
                ref.read(searchNewsControllerProvider.notifier).onEvent(
                    SaveSearchHistoryEvent(search: _searchController.text));
                BuzzWireHelperFunctions.hideKeyboard();
              }
            },
          ),
        ),
        body: _buildBody(uiState),
      ),
    );
  }

  Widget _buildBody(SearchNewsState uiState) {
    if (uiState.loadState is Empty) {
      return _buildSearchHistory(uiState.searchHistories);
    }

    if (uiState.loadState is Error && uiState.searchResults.isEmpty) {
      return BuzzWireEmptyOrErrorScreen.error(
        message: (uiState.loadState as Error).message,
        onPressed: () {},
      );
    }

    if (uiState.loadState is Loading && uiState.currentPage <= 1) {
      return const BuzzWireProgressLoader();
    }

    return ScrollNotificationHandler(
      child: _buildSearchResultList(uiState),
      loadMore: () => _fetchMoreNews(uiState),
      canLoadMoreData: () =>
          uiState.loadState is! Loading &&
          uiState.currentPage < uiState.lastPage,
    );
  }

  Widget _buildSearchHistory(List<SearchHistoryEntity> histories) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Recent"),
            const Gap(20),
            SearchHistoryList(
              searchHistories: histories,
              onItemClick: _onClickSearchHistory,
              onItemDelete: _onDeleteSearchHistory,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResultList(SearchNewsState uiState) {
    return PaginationListView(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      canLoadMoreData: () =>
          uiState.loadState is! Loading &&
          uiState.currentPage < uiState.lastPage,
      loadingWidget: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: BuzzWireProgressLoader(isInitialLoad: false),
      ),
      emptyWidget: BuzzWireEmptyOrErrorScreen.empty(
        header: "No Articles Found",
        message: "No results found for \"${_searchController.text}\"",
      ),
      hasError: uiState.loadState is Error,
      itemBuilder: ((ctx, idx) {
        final article = uiState.searchResults[idx];
        return NewsCard(
          article: article,
          onClick: (article) {
            _navToNewsDetailsScreen(article);
          },
          onSave: (article) async {
            final result = article.isSaved
                ? await _bookmarkArticle(article)
                : await _unbookmarkArticle(article);
            return result;
          },
        );
      }),
      separatorBuilder: (ctx, idx) => const Gap(15),
      itemCount: uiState.searchResults.length,
    );
  }

  void _onDeleteSearchHistory(SearchHistoryEntity history) {
    BuzzWireHelperFunctions.hideKeyboard();
    ref
        .read(searchNewsControllerProvider.notifier)
        .onEvent(DeleteSearchHistoryEvent(searchHistory: history));
  }

  void _onClickSearchHistory(SearchHistoryEntity history) {
    if (history.search != null) {
      BuzzWireHelperFunctions.hideKeyboard();
      _searchController.text = history.search!;
      _searchNews(history.search!);
    } else {
      _navToNewsDetailsScreen(history.article!);
    }
  }

  void _navToNewsDetailsScreen(ArticleEntity article) {
    context.pushNamed(BuzzWireRoute.newsDetails.name, extra: article);
  }

  Future<bool> _bookmarkArticle(ArticleEntity article) async {
    final result = await ref
        .read(searchNewsControllerProvider.notifier)
        .onEvent(SaveArticleEvent(article: article));
    return result as bool;
  }

  Future<bool> _unbookmarkArticle(ArticleEntity article) async {
    final result = await ref
        .read(searchNewsControllerProvider.notifier)
        .onEvent(DeleteSavedArticleEvent(article: article));
    return result as bool;
  }

  void _fetchMoreNews(SearchNewsState uiState) {
    ref.read(searchNewsControllerProvider.notifier).onEvent(
          FetchNewsEvent(
            query: _searchController.text,
            page: uiState.currentPage + 1,
          ),
        );
  }

  void _searchNews(String query) {
    ref
        .read(searchNewsControllerProvider.notifier)
        .onEvent(QueryNewsEvent(query));
  }

  void _resetLoadState() {
    ref
        .read(searchNewsControllerProvider.notifier)
        .onEvent(ResetLoadSateEvent());
  }

  void init() {
    ref
        .read(searchNewsControllerProvider.notifier)
        .onEvent(GetSearchHistoryEvent());

    ref
        .read(searchNewsControllerProvider.notifier)
        .onEvent(GetSavedArticlesEvent());
  }
}
