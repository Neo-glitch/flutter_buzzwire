import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/domain/repository/news_repository.dart';
import 'package:fpdart/src/either.dart';

class GetSavedArticlesUseCase
    implements UseCaseStream<List<ArticleEntity>, NoParams> {
  final NewsRepository repository;

  GetSavedArticlesUseCase({required this.repository});

  @override
  Stream<Either<Failure, List<ArticleEntity>>> call(NoParams param) {
    return repository.getSavedArticles();
  }
}
