import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/domain/usecases/delete_saved_article_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_saved_articles_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/save_article_usecase.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/core/network/dio/dio_helper.dart';
import 'package:buzzwire/core/utils/extensions/list_extension.dart';
import 'package:buzzwire/core/utils/extensions/num_extension.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_headlines_by_category_usecase.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/category_news_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_news_controller.g.dart';

@riverpod
class CategoryNewsController extends _$CategoryNewsController {
  late GetHeadlinesByCategory _getNewsHeadlines;
  late String _category;
  late SaveArticle _saveArticle;
  late DeleteSavedArticle _deleteSavedArticle;
  late GetSavedArticles _getSavedArticles;

  @override
  CategoryNewsState build(String category) {
    _getNewsHeadlines = injector();
    _saveArticle = injector();
    _deleteSavedArticle = injector();
    _getSavedArticles = injector();
    _category = category;
    return const CategoryNewsState();
  }

  void fetchNews(int page) async {
    if (state.loadState is Loading || state.currentPage > state.lastPage) {
      return;
    }

    final previousPage = state.currentPage;
    state = state.copyWith(loadState: const Loading(), currentPage: page);
    final response = await _getNewsHeadlines(
        GetHeadlinesByCategoryParams(page: page, category: _category));

    response.fold(
      (error) => state = state.copyWith(
          loadState: Error(message: error.message), currentPage: previousPage),
      (result) {
        final lastPage =
            (result.totalResults.orZero / BuzzWireDioHelper.pageSize).ceil();
        final articles = page > 1
            ? state.articles.toList() + result.articles.orEmpty
            : result.articles.orEmpty;
        final mappedArticles = _mapArticles(articles);
        state = state.copyWith(
          currentPage: page,
          lastPage: lastPage,
          articles: mappedArticles,
          loadState: const Loaded(),
        );
      },
    );
  }

  void fetchSavedArticles() {
    _getSavedArticles(NoParams()).listen(
      (result) {
        final savedArticles = result.getOrElse((l) => []);
        state = state.copyWith(savedArticles: savedArticles);
        // to get updated state of the remote fetched articles
        state = state.copyWith(articles: _mapArticles(state.articles));
      },
    );
  }

  List<ArticleEntity> _mapArticles(List<ArticleEntity> articles) {
    return articles.map((article) {
      article.isSaved = state.savedArticles.contains(article);
      return article;
    }).toList();
  }

  Future<bool> bookmarkArticle(ArticleEntity article) async {
    final result = await _saveArticle(article);
    return result.fold((l) => false, (r) => true);
  }

  Future<bool> unBookmarkArticle(ArticleEntity article) async {
    final result = await _deleteSavedArticle(article);
    return result.fold((l) => false, (r) => true);
  }
}
