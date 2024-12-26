import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/domain/usecases/delete_saved_article_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_saved_articles_usecase.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/saved_news_state.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'saved_news_controller.g.dart';

@riverpod
class SavedNewsController extends _$SavedNewsController {
  late DeleteSavedArticle _deleteSavedArticle;
  late GetSavedArticles _getSavedArticles;

  @override
  SavedNewsState build() {
    _deleteSavedArticle = injector();
    _getSavedArticles = injector();
    return const SavedNewsState();
  }

  void fetchSavedArticles() {
    state = state.copyWith(loadState: const Loading());
    _getSavedArticles(NoParams()).listen(
      (result) {
        final articles = result.getOrElse((l) => []).map((article) {
          article.isSaved = true;
          return article;
        });
        state = state.copyWith(
            savedArticles: articles.toList(), loadState: const Loaded());
      },
    );
  }

  void deleteSavedArticle(ArticleEntity article) {
    _deleteSavedArticle(article);
  }
}
