import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/domain/repository/news_repository.dart';
import 'package:fpdart/src/either.dart';

class DeleteSavedArticle implements UseCaseFutureVoid<ArticleEntity> {
  final NewsRepository repository;

  DeleteSavedArticle({required this.repository});

  @override
  Future<Either<Failure, void>> call(ArticleEntity entity) {
    return repository.deleteSavedArticle(entity);
  }
}
