import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/news/domain/entity/source_entity.dart';
import 'package:buzzwire/src/features/news/domain/repository/news_repository.dart';
import 'package:fpdart/src/either.dart';

class GetNewsSources implements UseCaseFuture<List<SourceEntity>?, NoParams> {
  final NewsRepository repository;

  GetNewsSources({required this.repository});

  @override
  Future<Either<Failure, List<SourceEntity>?>> call(NoParams param) {
    return repository.getNewsSources();
  }
}
