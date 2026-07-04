import 'package:buzzwire/core/database/model/local_article_model.dart';

abstract class NewsLocalDataSource {
  Future<int> getSavedArticlesCount();
  Future<List<LocalArticleModel>> getPaginatedSavedArticles(
      int pageSize, int pageOffset);
  Stream<List<LocalArticleModel>> getSavedArticles();
  Future<void> saveArticle(LocalArticleModel article);
  Future<void> deleteSavedArticle(LocalArticleModel article);
  Future<void> clearAllSavedArticles();
}
