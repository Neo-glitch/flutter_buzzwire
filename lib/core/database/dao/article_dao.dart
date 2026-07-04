import 'package:buzzwire/core/database/constant/database_constants.dart';
import 'package:buzzwire/src/features/news/data/model/local_article_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class ArticleDao {
  @Query('SELECT COUNT(*) FROM ${DatabaseConstants.savedNewsTableName}')
  Future<int?> getSavedArticlesItemCount();

  @Query(
      'SELECT * FROM ${DatabaseConstants.savedNewsTableName} ORDER BY savedAt DESC LIMIT :pageSize OFFSET :pageOffset')
  Future<List<LocalArticleModel>> getPaginatedSavedArticle(
      int pageSize, int pageOffset);

  @Query(
      'SELECT * FROM ${DatabaseConstants.savedNewsTableName} ORDER BY savedAt DESC')
  Stream<List<LocalArticleModel>> getSavedArticles();

  @insert
  Future<void> saveArticle(LocalArticleModel article);

  @delete
  Future<void> deleteSavedArticle(LocalArticleModel article);

  @Query('DELETE FROM ${DatabaseConstants.savedNewsTableName}')
  Future<void> clearAllSavedArticles();
}
