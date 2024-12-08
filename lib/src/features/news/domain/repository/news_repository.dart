import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/src/features/news/data/model/news_model.dart';
import 'package:buzzwire/src/features/news/data/model/news_source_model.dart';
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
}
