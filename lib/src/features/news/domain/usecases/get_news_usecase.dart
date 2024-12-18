import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/news/data/repository/news_repository_impl.dart';
import 'package:buzzwire/src/features/news/domain/entity/news_entity.dart';
import 'package:buzzwire/src/features/news/domain/repository/news_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_news_usecase.g.dart';

@riverpod
GetNews getNews(GetNewsRef ref) =>
    GetNews(repository: ref.read(newsRepositoryProvider));

class GetNews implements UseCaseFuture<NewsEntity, GetNewsParams> {
  final NewsRepository repository;

  GetNews({required this.repository});

  @override
  Future<Either<Failure, NewsEntity>> call(GetNewsParams param) {
    return repository.getNews(query: param.query, page: param.page);
  }
}

class GetNewsParams {
  final String query;
  final int page;

  GetNewsParams(this.query, this.page);
}
