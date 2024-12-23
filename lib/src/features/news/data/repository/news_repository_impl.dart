import 'package:buzzwire/core/error/exception_handler.dart';
import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/utils/extensions/list_extension.dart';
import 'package:buzzwire/src/features/news/data/datasources/local/news_local_datasource.dart';
import 'package:buzzwire/src/features/news/data/datasources/remote/news_remote_datasource.dart';
import 'package:buzzwire/src/features/news/data/mapper/article_mapper.dart';
import 'package:buzzwire/src/features/news/data/mapper/news_mapper.dart';
import 'package:buzzwire/src/features/news/data/mapper/source_mapper.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/domain/entity/news_entity.dart';
import 'package:buzzwire/src/features/news/domain/entity/source_entity.dart';
import 'package:buzzwire/src/features/news/domain/repository/news_repository.dart';
import 'package:fpdart/src/either.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;

  NewsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, NewsEntity>> getNews(
      {required String query, required int page}) async {
    try {
      final newsModel =
          await remoteDataSource.getNews(query: query, page: page);
      return Right(NewsMapper.toEntity(newsModel));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(ApiFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, NewsEntity>> getHeadlines() async {
    try {
      final newsModel = await remoteDataSource.getHeadlines();
      return Right(NewsMapper.toEntity(newsModel));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(ApiFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, NewsEntity>> getHeadlinesByCategory({
    required int page,
    required String category,
  }) async {
    try {
      final newsModel = await remoteDataSource.getHeadlinesByCategory(
          page: page, category: category);
      return Right(NewsMapper.toEntity(newsModel));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(ApiFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SourceEntity>?>> getNewsSources() async {
    try {
      final newsSourceModel = await remoteDataSource.getNewsSources();
      return Right(SourceMapper.toEntitites(newsSourceModel.sources));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(ApiFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearAllSavedArticles() async {
    try {
      return Right(await localDataSource.clearAllSavedArticles());
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(CacheFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSavedArticle(ArticleEntity entity) async {
    try {
      final model = ArticleMapper.toLocalArticleModel(entity);
      return Right(await localDataSource.deleteSavedArticle(model));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(CacheFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ArticleEntity>>> getPaginatedSavedArticles(
    int pageSize,
    int pageOffset,
  ) async {
    try {
      final articles =
          await localDataSource.getPaginatedSavedArticles(pageSize, pageOffset);
      final entities = ArticleMapper.toEntitiesFromLocalArticleModel(articles);
      return Right(entities.orEmpty);
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(CacheFailure(exception.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<ArticleEntity>>> getSavedArticles() {
    return localDataSource.getSavedArticles().map((articles) {
      return Right(
          ArticleMapper.toEntitiesFromLocalArticleModel(articles).orEmpty);
    });
  }

  @override
  Future<Either<Failure, int>> getSavedArticlesCount() async {
    try {
      return Right(await localDataSource.getSavedArticlesCount());
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(CacheFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveArticle(ArticleEntity entity) async {
    try {
      final model = ArticleMapper.toLocalArticleModel(entity);
      return Right(await localDataSource.saveArticle(model));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(CacheFailure(exception.toString()));
    }
  }
}
