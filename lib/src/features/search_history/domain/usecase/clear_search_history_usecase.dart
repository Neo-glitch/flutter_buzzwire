import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/search_history/domain/repository/search_history_repository.dart';
import 'package:fpdart/src/either.dart';

class ClearSearchHistoryUseCase implements UseCaseFutureVoid<NoParams> {
  final SearchHistoryRepository repository;

  ClearSearchHistoryUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParams param) {
    return repository.clearSearchHistory();
  }
}
