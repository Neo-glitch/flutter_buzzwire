import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/news/domain/repository/news_repository.dart';
import 'package:fpdart/src/either.dart';

class GetSavedArticlesCount implements UseCaseFuture<int, NoParams> {
  final NewsRepository repository;

  GetSavedArticlesCount({required this.repository});

  @override
  Future<Either<Failure, int>> call(NoParams param) {
    return repository.getSavedArticlesCount();
  }
}
