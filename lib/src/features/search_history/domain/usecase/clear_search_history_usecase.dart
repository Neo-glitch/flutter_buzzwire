import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/src/features/search_history/domain/repository/search_history_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClearSearchHistoryUseCase implements UseCaseFutureVoid<NoParams> {
  final SearchHistoryRepository repository;

  ClearSearchHistoryUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParams param) {
    return repository.clearSearchHistory();
  }
}
