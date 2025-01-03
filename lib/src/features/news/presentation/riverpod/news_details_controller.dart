import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/domain/usecases/delete_saved_article_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_saved_articles_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/save_article_usecase.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/news_details_state.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_details_controller.g.dart';

@riverpod
class NewsDetailsController extends _$NewsDetailsController {
  late SaveArticleUseCase _saveArticle;
  late DeleteSavedArticleUseCase _deleteSavedArticle;
  late GetSavedArticlesUseCase _getSavedArticles;

  @override
  NewsDetailsState build() {
    _saveArticle = injector();
    _deleteSavedArticle = injector();
    _getSavedArticles = injector();
    print("\nNews Detail controller Build called\n");
    return const NewsDetailsState();
  }

  void init(ArticleEntity article) {
    _getSavedArticles(NoParams()).listen((result) {
      final articles = result.getOrElse((l) => []);
      final doesArticleExist = _doesArticleExist(articles, article);
      state = state.copyWith(
        isArticleSaved: doesArticleExist,
        savedArticles: articles,
      );
    });
  }

  bool _doesArticleExist(
      List<ArticleEntity> savedArticles, ArticleEntity article) {
    return savedArticles.any((element) => article == element);
  }

  void setLoadState(LoadState loadState) {
    state = state.copyWith(loadState: loadState);
  }

  void saveOrDeleteNewsArticle(ArticleEntity article) {
    if (_doesArticleExist(state.savedArticles, article)) {
      final savedArticle = state.savedArticles.firstWhere(
        (element) {
          return element.title == article.title &&
              element.description == article.description;
        },
      );
      _deleteSavedArticle(savedArticle);
    } else {
      _saveArticle(article);
    }
  }
}
