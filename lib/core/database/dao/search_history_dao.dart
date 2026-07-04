import 'package:buzzwire/core/database/constant/database_constants.dart';
import 'package:buzzwire/core/database/model/search_history_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class SearchHistoryDao {
  @Query(
      'SELECT * FROM ${DatabaseConstants.searchHistoryTableName} ORDER BY createdAt DESC')
  Stream<List<SearchHistoryModel>> getSearchHistory();

  @insert
  Future<void> insertSearchHistory(SearchHistoryModel searchHistoryModel);

  @delete
  Future<void> deleteSearchHistory(SearchHistoryModel searchHistoryModel);

  @Query('DELETE FROM ${DatabaseConstants.searchHistoryTableName}')
  Future<void> clearSearchHistory();
}
