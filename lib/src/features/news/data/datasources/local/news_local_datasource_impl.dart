import 'package:buzzwire/core/common/extension/num_extension.dart';
import 'package:buzzwire/core/common/logging/logger_helper.dart';
import 'package:buzzwire/core/database/app_database.dart';
import 'package:buzzwire/core/database/model/local_article_model.dart';
import 'package:buzzwire/src/features/news/data/datasources/local/news_local_datasource.dart';

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
