import 'package:buzzwire/core/database/model/search_history_model.dart';

abstract class SearchHistoryLocalDataSource {
  Stream<List<SearchHistoryModel>> getSearchHistory();
  Future<void> saveSearchHistory(SearchHistoryModel searchHistory);
  Future<void> deleteSearchHistory(SearchHistoryModel searchHistory);
  Future<void> clearSearchHistory();
}
