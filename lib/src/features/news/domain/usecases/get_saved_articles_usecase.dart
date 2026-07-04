import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/domain/repository/news_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSavedArticlesUseCase
    implements UseCaseStream<List<ArticleEntity>, NoParams> {
  final NewsRepository repository;

  GetSavedArticlesUseCase({required this.repository});

  @override
  Stream<Either<Failure, List<ArticleEntity>>> call(NoParams param) {
    return repository.getSavedArticles();
  }
}
