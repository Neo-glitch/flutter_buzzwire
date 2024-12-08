import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/news/data/repository/news_repository_impl.dart';
import 'package:buzzwire/src/features/news/domain/entity/news_entity.dart';
import 'package:buzzwire/src/features/news/domain/repository/news_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_headlines_usecase.g.dart';

@riverpod
GetHeadlines getHeadlines(GetHeadlinesRef ref) =>
    GetHeadlines(repository: ref.read(newsRepositoryProvider));

class GetHeadlines implements UseCaseFuture<NewsEntity, NoParams> {
  final NewsRepository repository;

  GetHeadlines({required this.repository});

  @override
  Future<Either<Failure, NewsEntity>> call(NoParams param) async {
    return repository.getHeadlines();
  }
}
