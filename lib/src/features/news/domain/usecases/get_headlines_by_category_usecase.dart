import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/src/features/news/domain/entity/news_entity.dart';
import 'package:buzzwire/src/features/news/domain/repository/news_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetHeadlinesByCategoryUseCase
    implements UseCaseFuture<NewsEntity, GetHeadlinesByCategoryParams> {
  final NewsRepository repository;

  GetHeadlinesByCategoryUseCase({required this.repository});

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
