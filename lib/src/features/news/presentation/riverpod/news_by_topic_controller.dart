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
import 'package:buzzwire/src/features/news/presentation/riverpod/news_by_topic_state.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_by_topic_controller.g.dart';

@riverpod
class NewsByTopicController extends _$NewsByTopicController {
  late GetNewsUseCase _getNews;
  late SaveArticleUseCase _saveArticle;
  late DeleteSavedArticleUseCase _deleteSavedArticle;
  late GetSavedArticlesUseCase _getSavedArticles;

  @override
  NewsByTopicState build() {
    _getNews = injector();
    _saveArticle = injector();
    _deleteSavedArticle = injector();
    _getSavedArticles = injector();
    return const NewsByTopicState();
  }

  Future<void> fetchNews(int page, String topic) async {
    if (state.loadState is Loading || state.currentPage > state.lastPage) {
      return;
    }

    final previousPage = state.currentPage;
    state = state.copyWith(loadState: const Loading(), currentPage: page);
    final response = await _getNews(GetNewsParams(topic, page));

    response.fold(
      (error) => state = state.copyWith(
          loadState: Error(message: error.message), currentPage: previousPage),
      (result) {
        final lastPage =
            (result.totalResults.orZero / BuzzWireAppConstants.pageSize).ceil();
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
      final localArticle =
          state.savedArticles.firstWhereOrNull((element) => article == element);

      article
        ..isSaved = localArticle != null
        ..id = localArticle?.id;

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
