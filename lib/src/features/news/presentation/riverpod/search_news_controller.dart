import 'package:buzzwire/core/network/dio/dio_helper.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/core/utils/extensions/list_extension.dart';
import 'package:buzzwire/core/utils/extensions/num_extension.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_news_usecase.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/search_news_event.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/search_news_state.dart';
import 'package:buzzwire/src/features/search_history/domain/entity/search_history_entity.dart';
import 'package:buzzwire/src/features/search_history/domain/usecase/delete_search_history_usecase.dart';
import 'package:buzzwire/src/features/search_history/domain/usecase/get_does_search_history_exist_usecase.dart';
import 'package:buzzwire/src/features/search_history/domain/usecase/get_search_history_usecase.dart';
import 'package:buzzwire/src/features/search_history/domain/usecase/save_search_history_usecase.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_news_controller.g.dart';

@riverpod
class SearchNewsController extends _$SearchNewsController {
  late GetSearchHistory _getSearchHistory;
  late DeleteSearchHistory _deleteSearchHistory;
  late GetDoesSearchHistoryExist _doesSearchHistoryExist;
  late SaveSearchHistory _saveSearchHistory;
  late GetNews _getNews;

  @override
  SearchNewsState build() {
    _getSearchHistory = injector();
    _deleteSearchHistory = injector();
    _doesSearchHistoryExist = injector();
    _saveSearchHistory = injector();
    _getNews = injector();
    return const SearchNewsState();
  }

  void onEvent(SearchNewsEvent event) {
    switch (event) {
      case QueryNewsEvent():
        _searchNews(event);
      case FetchNewsEvent():
        _fetchNews(event);
      case SaveSearchHistoryEvent():
        _saveSearch(event);
        break;
      case DeleteSearchHistoryEvent():
        _deleteSearch(event);
        break;
      case GetSearchHistoryEvent():
        _getSearch();
        break;
      case ResetLoadSateEvent():
        state = state.copyWith(loadState: const Empty());
        break;
    }
  }

  void _getSearch() {
    _getSearchHistory(NoParams()).listen(
      (result) {
        final histories = result.getOrElse((l) => []);
        state = state.copyWith(searchHistories: histories);
      },
    );
  }

  void _saveSearch(SaveSearchHistoryEvent event) async {
    final doesSearchExistResult = await _doesSearchHistoryExist(
      GetDoesSearchHistoryExistParam(
          search: event.search, articleTitle: event.article?.title),
    );

    final doesHistoryExist = doesSearchExistResult.fold(
        (l) => false, (doesHistoryExist) => doesHistoryExist);
    if (event.search != null && !doesHistoryExist) {
      _saveSearchHistory(SearchHistoryEntity(search: event.search));
    } else if (event.article != null && !doesHistoryExist) {
      _saveSearchHistory(SearchHistoryEntity(article: event.article));
    }
  }

  void _fetchNews(FetchNewsEvent event) async {
    if (state.loadState is Loading || state.currentPage > state.lastPage) {
      return;
    }

    final previousPage = state.currentPage;
    state = state.copyWith(loadState: const Loading(), currentPage: event.page);
    final response = await _getNews(GetNewsParams(event.query, event.page));

    response.fold(
      (error) => state = state.copyWith(
          loadState: Error(message: error.message), currentPage: previousPage),
      (result) {
        final lastPage =
            (result.totalResults.orZero / BuzzWireDioHelper.pageSize).ceil();
        final articles = state.searchResults.toList() + result.articles.orEmpty;

        state = state.copyWith(
          lastPage: lastPage,
          searchResults: articles,
          loadState: const Loaded(),
        );
      },
    );
  }

  void _searchNews(QueryNewsEvent event) async {
    state = state.copyWith(
      loadState: const Loading(),
      currentPage: 1,
      lastPage: 1,
      searchResults: [],
    );
    final response = await _getNews(GetNewsParams(event.query, 1));

    response.fold(
      (error) =>
          state = state.copyWith(loadState: Error(message: error.message)),
      (result) {
        final lastPage =
            (result.totalResults.orZero / BuzzWireDioHelper.pageSize).ceil();
        state = state.copyWith(
          loadState: const Loaded(),
          searchResults: result.articles.orEmpty,
          currentPage: 1,
          lastPage: lastPage,
        );
      },
    );
  }

  void _deleteSearch(DeleteSearchHistoryEvent event) async {
    await _deleteSearchHistory(event.searchHistory);
  }
}
