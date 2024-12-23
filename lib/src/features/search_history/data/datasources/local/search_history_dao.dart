import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/src/features/search_history/data/model/search_history_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class SearchHistoryDao {
  @Query(
      'SELECT * FROM ${BuzzWireStrings.searchHistoryTableName} ORDER BY createdAt DESC')
  Stream<List<SearchHistoryModel>> getSearchHistory();

  @insert
  Future<void> insertSearchHistory(SearchHistoryModel searchHistoryModel);

  @delete
  Future<void> deleteSearchHistory(SearchHistoryModel searchHistoryModel);

  @Query('DELETE FROM ${BuzzWireStrings.searchHistoryTableName}')
  Future<void> clearSearchHistory();

  @Query('''
    SELECT EXISTS(
      SELECT 1 FROM ${BuzzWireStrings.searchHistoryTableName}
      WHERE 
        (:search != '' AND search = :search) 
        OR (:articleTitle != '' AND article.title = :articleTitle)
      LIMIT 1
    )
  ''')
  Future<bool?> doesSearchHistoryExist(String search, String articleTitle);
}
