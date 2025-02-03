import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/core/utils/extensions/list_extension.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/domain/usecases/delete_saved_article_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_saved_articles_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/save_article_usecase.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/news_detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_detail_controller.g.dart';

@riverpod
class NewsDetailController extends _$NewsDetailController {
  late SaveArticleUseCase _saveArticle;
  late DeleteSavedArticleUseCase _deleteSavedArticle;
  late GetSavedArticlesUseCase _getSavedArticles;

  @override
  NewsDetailState build(ArticleEntity article) {
    _saveArticle = injector();
    _deleteSavedArticle = injector();
    _getSavedArticles = injector();
    return NewsDetailState(article: article);
  }

  void mapArticle() async {
    final article = state.article;
    final result = await _getSavedArticles(NoParams()).first;
    final localArticles = result.getOrElse((l) => []);
    final localArticle =
        localArticles.firstWhereOrNull((element) => article == element);
    article?.id = localArticle?.id;
    state = state.copyWith(article: article);
  }

  void saveOrUnsaveNewsArticle() async {
    final article = state.article!;
    if (article.isSaved) {
      final result = await _deleteSavedArticle(article);
      result.fold(
        (l) {},
        (_) {
          article.isSaved = false;
          state = state.copyWith(article: article);
        },
      );
    } else {
      final result = await _saveArticle(article);
      result.fold(
        (l) {},
        (_) {
          article.isSaved = true;
          state = state.copyWith(article: article);
        },
      );
    }
  }
}
