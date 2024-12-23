import 'package:buzzwire/core/error/exception_handler.dart';
import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/src/features/search_history/data/datasources/local/search_history_local_datasource.dart';
import 'package:buzzwire/src/features/search_history/data/mapper/search_history_mapper.dart';
import 'package:buzzwire/src/features/search_history/domain/entity/search_history_entity.dart';
import 'package:buzzwire/src/features/search_history/domain/repository/search_history_repository.dart';
import 'package:fpdart/src/either.dart';

class SearchHistoryRepositoryImpl implements SearchHistoryRepository {
  final SearchHistoryLocalDataSource localDataSource;

  SearchHistoryRepositoryImpl({required this.localDataSource});
  @override
  Future<Either<Failure, void>> clearSearchHistory() async {
    try {
      return Right(await localDataSource.clearSearchHistory());
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(CacheFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSearchHistory(
      SearchHistoryEntity entity) async {
    try {
      final model = SearchHistoryMapper.toModel(entity);
      return Right(await localDataSource.deleteSearchHistory(model));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(CacheFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> doesSearchHistoryExist(
    String? search,
    String? articleTitle,
  ) async {
    try {
      return Right(await localDataSource.doesSearchHistoryExist(
        search,
        articleTitle,
      ));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(CacheFailure(exception.toString()));
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
      final exception = ExceptionHandler.handleException(e);
      return Left(CacheFailure(exception.toString()));
    }
  }
}
