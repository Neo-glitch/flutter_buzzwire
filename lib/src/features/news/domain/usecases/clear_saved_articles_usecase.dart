import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/news/domain/repository/news_repository.dart';
import 'package:fpdart/src/either.dart';

class ClearSavedArticles implements UseCaseFutureVoid<NoParams> {
  final NewsRepository repository;

  ClearSavedArticles({required this.repository});
  @override
  Future<Either<Failure, void>> call(NoParams param) {
    return repository.clearAllSavedArticles();
  }
}
