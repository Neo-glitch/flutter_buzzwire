import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:buzzwire/core/exception/exception_handler.dart';
import 'package:buzzwire/src/features/search_history/data/datasources/local/search_history_local_datasource.dart';
import 'package:buzzwire/src/features/search_history/data/mapper/search_history_mapper.dart';
import 'package:buzzwire/src/features/search_history/domain/entity/search_history_entity.dart';
import 'package:buzzwire/src/features/search_history/domain/repository/search_history_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SearchHistoryRepository)
class SearchHistoryRepositoryImpl implements SearchHistoryRepository {
  final SearchHistoryLocalDataSource localDataSource;

  SearchHistoryRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, void>> clearSearchHistory() async {
    try {
      return Right(await localDataSource.clearSearchHistory());
    } on Exception catch (e) {
      return Left(ExceptionHandler.toFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSearchHistory(
      SearchHistoryEntity entity) async {
    try {
      final model = SearchHistoryMapper.toModel(entity);
      return Right(await localDataSource.deleteSearchHistory(model));
    } on Exception catch (e) {
      return Left(ExceptionHandler.toFailure(e));
    }
  }

  @override
  Stream<Either<Failure, List<SearchHistoryEntity>>> getSearchHistory() {
    return localDataSource.getSearchHistory().map((searchHistory) =>
        Right(SearchHistoryMapper.toEntities(searchHistory)));
  }

  @override
  Future<Either<Failure, void>> saveSearchHistory(
      SearchHistoryEntity entity) async {
    try {
      final model = SearchHistoryMapper.toModel(entity);
      return Right(await localDataSource.saveSearchHistory(model));
    } on Exception catch (e) {
      return Left(ExceptionHandler.toFailure(e));
    }
  }
}
