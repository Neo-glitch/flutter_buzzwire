import 'package:buzzwire/core/error/exception_handler.dart';
import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/src/features/news/data/datasources/remote/news_remote_datasource.dart';
import 'package:buzzwire/src/features/news/data/mapper/news_mapper.dart';
import 'package:buzzwire/src/features/news/data/mapper/source_mapper.dart';
import 'package:buzzwire/src/features/news/domain/entity/news_entity.dart';
import 'package:buzzwire/src/features/news/domain/entity/source_entity.dart';
import 'package:buzzwire/src/features/news/domain/repository/news_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_repository_impl.g.dart';

@riverpod
NewsRepository newsRepository(NewsRepositoryRef ref) => NewsRepositoryImpl(
    remoteDataSource: ref.read(newsRemoteDataSourceProvider));

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

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
}
