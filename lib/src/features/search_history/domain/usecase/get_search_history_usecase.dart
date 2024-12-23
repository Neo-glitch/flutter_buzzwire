import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/search_history/domain/entity/search_history_entity.dart';
import 'package:buzzwire/src/features/search_history/domain/repository/search_history_repository.dart';
import 'package:fpdart/src/either.dart';

class GetSearchHistory
    implements UseCaseStream<List<SearchHistoryEntity>, NoParams> {
  final SearchHistoryRepository repository;

  GetSearchHistory({required this.repository});

  @override
  Stream<Either<Failure, List<SearchHistoryEntity>>> call(NoParams param) {
    return repository.getSearchHistory();
  }
}
