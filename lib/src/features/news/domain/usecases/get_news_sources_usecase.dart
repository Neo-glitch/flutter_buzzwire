import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/src/features/news/domain/entity/source_entity.dart';
import 'package:buzzwire/src/features/news/domain/repository/news_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetNewsSourcesUseCase
    implements UseCaseFuture<List<SourceEntity>?, NoParams> {
  final NewsRepository repository;

  GetNewsSourcesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<SourceEntity>?>> call(NoParams param) {
    return repository.getNewsSources();
  }
}
