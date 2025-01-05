import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/news/domain/entity/news_entity.dart';
import 'package:buzzwire/src/features/news/domain/repository/news_repository.dart';
import 'package:fpdart/src/either.dart';

class GetHeadlinesUseCase implements UseCaseFuture<NewsEntity, NoParams> {
  final NewsRepository repository;

  GetHeadlinesUseCase({required this.repository});

  @override
  Future<Either<Failure, NewsEntity>> call(NoParams param) async {
    return repository.getHeadlines();
  }
}
