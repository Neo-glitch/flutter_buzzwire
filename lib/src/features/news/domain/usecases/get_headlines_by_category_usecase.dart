import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/news/data/repository/news_repository_impl.dart';
import 'package:buzzwire/src/features/news/domain/entity/news_entity.dart';
import 'package:buzzwire/src/features/news/domain/repository/news_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_headlines_by_category_usecase.g.dart';

@riverpod
GetHeadlinesByCategory getHeadlinesByCategory(GetHeadlinesByCategoryRef ref) =>
    GetHeadlinesByCategory(repository: ref.read(newsRepositoryProvider));

class GetHeadlinesByCategory
    implements UseCaseFuture<NewsEntity, GetHeadlinesByCategoryParams> {
  final NewsRepository repository;

  GetHeadlinesByCategory({required this.repository});

  @override
  Future<Either<Failure, NewsEntity>> call(GetHeadlinesByCategoryParams param) {
    return repository.getHeadlinesByCategory(
        page: param.page, category: param.category);
  }
}

class GetHeadlinesByCategoryParams {
  final int page;
  final String category;

  GetHeadlinesByCategoryParams({required this.page, required this.category});
}
