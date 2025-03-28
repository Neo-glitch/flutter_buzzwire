import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/news/domain/entity/news_entity.dart';
import 'package:buzzwire/src/features/news/domain/repository/news_repository.dart';
import 'package:fpdart/src/either.dart';

class GetNewsUseCase implements UseCaseFuture<NewsEntity, GetNewsParams> {
  final NewsRepository repository;

  GetNewsUseCase({required this.repository});

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
