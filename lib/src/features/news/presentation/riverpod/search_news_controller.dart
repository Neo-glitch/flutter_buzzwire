import 'package:buzzwire/core/constants/app_constants.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/core/utils/extensions/list_extension.dart';
import 'package:buzzwire/core/utils/extensions/num_extension.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/domain/usecases/delete_saved_article_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_news_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_saved_articles_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/save_article_usecase.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/search_news_event.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/search_news_state.dart';
import 'package:buzzwire/src/features/search_history/domain/entity/search_history_entity.dart';
import 'package:buzzwire/src/features/search_history/domain/usecase/delete_search_history_usecase.dart';
import 'package:buzzwire/src/features/search_history/domain/usecase/get_search_history_usecase.dart';
import 'package:buzzwire/src/features/search_history/domain/usecase/save_search_history_usecase.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_news_controller.g.dart';

@riverpod
class SearchNewsController extends _$SearchNewsController {
  late GetSearchHistoryUseCase _getSearchHistory;
  late DeleteSearchHistoryUseCase _deleteSearchHistory;
  late SaveSearchHistoryUseCase _saveSearchHistory;
  late SaveArticleUseCase _saveArticle;
  late DeleteSavedArticleUseCase _deleteSavedArticle;
  late GetSavedArticlesUseCase _getSavedArticles;
  late GetNewsUseCase _getNews;

  @override
  SearchNewsState build() {
    _getSearchHistory = injector();
    _deleteSearchHistory = injector();
    _saveSearchHistory = injector();
    _getNews = injector();
    _saveArticle = injector();
    _deleteSavedArticle = injector();
    _getSavedArticles = injector();
    return const SearchNewsState();
  }

  Future<Object?> onEvent(SearchNewsEvent event) async {
    switch (event) {
      case QueryNewsEvent():
        _searchNews(event);
        return null;
      case FetchNewsEvent():
        _fetchNews(event);
        return null;
      case SaveSearchHistoryEvent():
        _saveSearch(event);
        return null;
      case DeleteSearchHistoryEvent():
        _deleteSearch(event);
        return null;
      case GetSearchHistoryEvent():
        _getSearch();
        return null;
      case ResetLoadSateEvent():
        state = state.copyWith(loadState: const Empty());
        return null;
      case SaveArticleEvent():
        return await _bookmarkArticle(event);
      case DeleteSavedArticleEvent():
        return await _unBookmarkArticle(event);
      case GetSavedArticlesEvent():
        _fetchSavedArticles();
        return null;
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
    final doesHistoryExist = state.searchHistories.any(
      (searchHistory) =>
          (event.search != null && searchHistory.search == event.search) ||
          (event.article != null && searchHistory.article == event.article),
    );

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
            (result.totalResults.orZero / BuzzWireAppConstants.pageSize).ceil();
        final articles = state.searchResults.toList() + result.articles.orEmpty;

        state = state.copyWith(
          currentPage: event.page,
          lastPage: lastPage,
          searchResults: _mapArticles(articles),
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
            (result.totalResults.orZero / BuzzWireAppConstants.pageSize).ceil();

        state = state.copyWith(
          loadState: const Loaded(),
          searchResults: _mapArticles(result.articles.orEmpty),
          currentPage: 1,
          lastPage: lastPage,
        );
      },
    );
  }

  List<ArticleEntity> _mapArticles(List<ArticleEntity> articles) {
    return articles.map((article) {
      final localArticle =
          state.savedArticles.firstWhereOrNull((element) => article == element);

      article
        ..isSaved = localArticle != null
        ..id = localArticle?.id;

      return article;
    }).toList();
  }

  void _deleteSearch(DeleteSearchHistoryEvent event) async {
    await _deleteSearchHistory(event.searchHistory);
  }

  Future<bool> _bookmarkArticle(SaveArticleEvent event) async {
    final result = await _saveArticle(event.article);
    return result.fold((l) => false, (r) => true);
  }

  Future<bool> _unBookmarkArticle(DeleteSavedArticleEvent event) async {
    final result = await _deleteSavedArticle(event.article);
    return result.fold((l) => false, (r) => true);
  }

  void _fetchSavedArticles() {
    _getSavedArticles(NoParams()).listen(
      (result) {
        final savedArticles = result.getOrElse((l) => []);
        state = state.copyWith(savedArticles: savedArticles);
        // to get updated state of the remote fetched articles
        state =
            state.copyWith(searchResults: _mapArticles(state.searchResults));
      },
    );
  }
}
