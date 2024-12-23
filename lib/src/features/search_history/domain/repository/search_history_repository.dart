import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/src/features/search_history/domain/entity/search_history_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class SearchHistoryRepository {
  Stream<Either<Failure, List<SearchHistoryEntity>>> getSearchHistory();
  Future<Either<Failure, void>> saveSearchHistory(SearchHistoryEntity entity);
  Future<Either<Failure, void>> deleteSearchHistory(SearchHistoryEntity entity);
  Future<Either<Failure, void>> clearSearchHistory();
  Future<Either<Failure, bool>> doesSearchHistoryExist(
    String? search,
    String? articleTitle,
  );
}
