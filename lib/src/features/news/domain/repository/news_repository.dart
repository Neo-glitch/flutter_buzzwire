import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/domain/entity/news_entity.dart';
import 'package:buzzwire/src/features/news/domain/entity/source_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<SourceEntity>?>> getNewsSources();
  Future<Either<Failure, NewsEntity>> getHeadlines();
  Future<Either<Failure, NewsEntity>> getHeadlinesByCategory(
      {required int page, required String category});
  Future<Either<Failure, NewsEntity>> getNews(
      {required String query, required int page});

  Future<Either<Failure, void>> clearAllSavedArticles();
  Future<Either<Failure, void>> deleteSavedArticle(ArticleEntity entity);
  Future<Either<Failure, List<ArticleEntity>>> getPaginatedSavedArticles(
      int pageSize, int pageOffset);

  Stream<Either<Failure, List<ArticleEntity>>> getSavedArticles();
  Future<Either<Failure, int>> getSavedArticlesCount();
  Future<Either<Failure, void>> saveArticle(ArticleEntity entity);
}
