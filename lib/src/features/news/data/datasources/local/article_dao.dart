import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/src/features/news/data/model/local_article_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class ArticleDao {
  @Query('SELECT COUNT(*) FROM ${BuzzWireStrings.savedNewsTableName}')
  Future<int?> getSavedArticlesItemCount();

  @Query(
      'SELECT * FROM ${BuzzWireStrings.savedNewsTableName} ORDER BY savedAt DESC LIMIT :pageSize OFFSET :pageOffset')
  Future<List<LocalArticleModel>> getPaginatedSavedArticle(
      int pageSize, int pageOffset);

  @Query(
      'SELECT * FROM ${BuzzWireStrings.savedNewsTableName} ORDER BY savedAt DESC')
  Stream<List<LocalArticleModel>> getSavedArticles();

  @insert
  Future<void> saveArticle(LocalArticleModel article);

  @delete
  Future<void> deleteSavedArticle(LocalArticleModel article);

  @Query('DELETE FROM ${BuzzWireStrings.savedNewsTableName}')
  Future<void> clearAllSavedArticles();
}
