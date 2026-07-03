import 'package:buzzwire/core/domain/error/failure.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/src/features/search_history/domain/entity/search_history_entity.dart';
import 'package:buzzwire/src/features/search_history/domain/repository/search_history_repository.dart';
import 'package:fpdart/src/either.dart';

class SaveSearchHistoryUseCase
    implements UseCaseFutureVoid<SearchHistoryEntity> {
  final SearchHistoryRepository repository;

  SaveSearchHistoryUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(SearchHistoryEntity param) {
    return repository.saveSearchHistory(param);
  }
}
