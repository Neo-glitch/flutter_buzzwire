import 'package:buzzwire/core/common/logging/logger_helper.dart';
import 'package:buzzwire/core/database/app_database.dart';
import 'package:buzzwire/core/database/model/search_history_model.dart';
import 'package:buzzwire/src/features/search_history/data/datasources/local/search_history_local_datasource.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SearchHistoryLocalDataSource)
class SearchHistoryLocalDataSourceImpl extends SearchHistoryLocalDataSource {
  final AppDatabase database;

  SearchHistoryLocalDataSourceImpl({required this.database});

  @override
  Future<void> clearSearchHistory() async {
    return await database.searchHistoryDao.clearSearchHistory();
  }

  @override
  Future<void> deleteSearchHistory(SearchHistoryModel searchHistory) async {
    return await database.searchHistoryDao.deleteSearchHistory(searchHistory);
  }

  @override
  Stream<List<SearchHistoryModel>> getSearchHistory() {
    return database.searchHistoryDao.getSearchHistory().handleError((error) {
      BuzzWireLoggerHelper.error(error.toString());
    });
  }

  @override
  Future<void> saveSearchHistory(SearchHistoryModel searchHistory) async {
    return await database.searchHistoryDao.insertSearchHistory(searchHistory);
  }
}
