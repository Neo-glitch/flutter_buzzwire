import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/news/data/repository/news_repository_impl.dart';
import 'package:buzzwire/src/features/news/domain/entity/source_entity.dart';
import 'package:buzzwire/src/features/news/domain/repository/news_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_news_sources_usecase.g.dart';

@riverpod
GetNewsSources getNewsSources(GetNewsSourcesRef ref) =>
    GetNewsSources(repository: ref.read(newsRepositoryProvider));

class GetNewsSources implements UseCaseFuture<List<SourceEntity>?, NoParams> {
  final NewsRepository repository;

  GetNewsSources({required this.repository});

  @override
  Future<Either<Failure, List<SourceEntity>?>> call(NoParams param) {
    return repository.getNewsSources();
  }
}
