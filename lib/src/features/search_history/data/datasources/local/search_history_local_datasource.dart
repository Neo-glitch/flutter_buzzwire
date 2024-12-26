import 'package:buzzwire/core/utils/logging/logger_helper.dart';
import 'package:buzzwire/src/features/search_history/data/model/search_history_model.dart';
import 'package:buzzwire/src/shared/data/datasources/local/app_database.dart';

abstract class SearchHistoryLocalDataSource {
  Stream<List<SearchHistoryModel>> getSearchHistory();
  Future<void> saveSearchHistory(SearchHistoryModel searchHistory);
  Future<void> deleteSearchHistory(SearchHistoryModel searchHistory);
  Future<void> clearSearchHistory();
}

class SearchHistoryLocalDataSourceImpl extends SearchHistoryLocalDataSource {
  final AppDatabase database;

  SearchHistoryLocalDataSourceImpl({required this.database});
  @override
  Future<void> clearSearchHistory() async {
    try {
      return await database.searchHistoryDao.clearSearchHistory();
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteSearchHistory(SearchHistoryModel searchHistory) async {
    try {
      return await database.searchHistoryDao.deleteSearchHistory(searchHistory);
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Stream<List<SearchHistoryModel>> getSearchHistory() {
    return database.searchHistoryDao.getSearchHistory().handleError((error) {
      BuzzWireLoggerHelper.error(error.toString());
    });
  }

  @override
  Future<void> saveSearchHistory(SearchHistoryModel searchHistory) async {
    try {
      return await database.searchHistoryDao.insertSearchHistory(searchHistory);
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }
}
