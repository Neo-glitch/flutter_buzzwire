import 'package:buzzwire/core/utils/helpers/debouncer.dart';
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
      ref
          .read(searchNewsControllerProvider.notifier)
          .onEvent(GetSearchHistoryEvent());
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
                  ref
                      .read(searchNewsControllerProvider.notifier)
                      .onEvent(QueryNewsEvent(value));
                });
              } else {
                _debouncer.cancel();
                ref
                    .read(searchNewsControllerProvider.notifier)
                    .onEvent(ResetLoadSateEvent());
              }
            },
            onClear: () {
              _debouncer.cancel();
              ref
                  .read(searchNewsControllerProvider.notifier)
                  .onEvent(ResetLoadSateEvent());
            },
            onEditingComplete: () {
              if (_searchController.text.isNotEmpty) {
                ref.read(searchNewsControllerProvider.notifier).onEvent(
                    SaveSearchHistoryEvent(search: _searchController.text));
                FocusManager.instance.primaryFocus?.unfocus();
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
      loadMore: () => ref
          .read(searchNewsControllerProvider.notifier)
          .onEvent(FetchNewsEvent(
            query: _searchController.text,
            page: uiState.currentPage + 1,
          )),
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
          onSave: (article) {},
        );
      }),
      separatorBuilder: (ctx, idx) => const Gap(15),
      itemCount: uiState.searchResults.length,
    );
  }

  void _onDeleteSearchHistory(SearchHistoryEntity history) {
    FocusManager.instance.primaryFocus?.unfocus();
    ref
        .read(searchNewsControllerProvider.notifier)
        .onEvent(DeleteSearchHistoryEvent(searchHistory: history));
  }

  void _onClickSearchHistory(SearchHistoryEntity history) {
    if (history.search != null) {
      FocusManager.instance.primaryFocus?.unfocus();
      _searchController.text = history.search!;
      ref
          .read(searchNewsControllerProvider.notifier)
          .onEvent(QueryNewsEvent(history.search!));
    } else if (history.article != null) {
      _navToNewsDetailsScreen(history.article!);
    }
  }

  void _navToNewsDetailsScreen(ArticleEntity article) {
    ref
        .read(searchNewsControllerProvider.notifier)
        .onEvent(SaveSearchHistoryEvent(article: article));
  }

  void _saveNews(ArticleEntity article) {}
}
