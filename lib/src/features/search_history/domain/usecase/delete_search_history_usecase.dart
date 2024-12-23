import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/search_history/domain/entity/search_history_entity.dart';
import 'package:buzzwire/src/features/search_history/domain/repository/search_history_repository.dart';
import 'package:fpdart/src/either.dart';

class DeleteSearchHistory implements UseCaseFutureVoid<SearchHistoryEntity> {
  final SearchHistoryRepository repository;

  DeleteSearchHistory({required this.repository});

  @override
  Future<Either<Failure, void>> call(SearchHistoryEntity param) {
    return repository.deleteSearchHistory(param);
  }
}
