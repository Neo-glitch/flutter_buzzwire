import 'package:buzzwire/core/utils/extensions/num_extension.dart';
import 'package:buzzwire/core/utils/logging/logger_helper.dart';
import 'package:buzzwire/src/features/news/data/model/local_article_model.dart';
import 'package:buzzwire/src/shared/data/datasources/local/app_database.dart';

abstract class NewsLocalDataSource {
  Future<int> getSavedArticlesCount();
  Future<List<LocalArticleModel>> getPaginatedSavedArticles(
      int pageSize, int pageOffset);
  Stream<List<LocalArticleModel>> getSavedArticles();
  Future<void> saveArticle(LocalArticleModel article);
  Future<void> deleteSavedArticle(LocalArticleModel article);
  Future<void> clearAllSavedArticles();
}

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final AppDatabase database;

  NewsLocalDataSourceImpl({required this.database});
  @override
  Future<void> clearAllSavedArticles() async {
    try {
      return await database.newsDao.clearAllSavedArticles();
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteSavedArticle(LocalArticleModel article) async {
    try {
      return await database.newsDao.deleteSavedArticle(article);
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<List<LocalArticleModel>> getPaginatedSavedArticles(
      int pageSize, int pageOffset) async {
    try {
      return await database.newsDao
          .getPaginatedSavedArticle(pageSize, pageOffset);
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Stream<List<LocalArticleModel>> getSavedArticles() {
    return database.newsDao.getSavedArticles().handleError((error) {
      BuzzWireLoggerHelper.error(error.toString());
    });
  }

  @override
  Future<int> getSavedArticlesCount() async {
    try {
      final itemCount = await database.newsDao.getSavedArticlesItemCount();
      return itemCount.orZero;
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<void> saveArticle(LocalArticleModel article) async {
    try {
      return await database.newsDao.saveArticle(article);
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }
}
