import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/domain/repository/news_repository.dart';
import 'package:fpdart/src/either.dart';

class GetPaginatedSavedArticles
    implements
        UseCaseFuture<List<ArticleEntity>, GetPaginatedSavedArticlesParams> {
  final NewsRepository repository;

  GetPaginatedSavedArticles({required this.repository});

  @override
  Future<Either<Failure, List<ArticleEntity>>> call(
      GetPaginatedSavedArticlesParams param) {
    return repository.getPaginatedSavedArticles(
        param.pageSize, param.pageOffset);
  }
}

class GetPaginatedSavedArticlesParams {
  final int pageSize;
  final int pageOffset;

  GetPaginatedSavedArticlesParams(
      {required this.pageSize, required this.pageOffset});
}
