import 'package:buzzwire/core/database/app_database.dart';
import 'package:buzzwire/core/database/model/search_history_model.dart';
import 'package:buzzwire/core/database/table/search_history_table.dart';
import 'package:drift/drift.dart';

part 'search_history_dao.g.dart';

@DriftAccessor(tables: [SearchHistoryTable])
class SearchHistoryDao extends DatabaseAccessor<AppDatabase>
    with _$SearchHistoryDaoMixin {
  SearchHistoryDao(super.db);

  Stream<List<SearchHistoryModel>> getSearchHistory() {
    return (select(searchHistoryTable)
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .watch()
        .map((rows) => rows.map(_toModel).toList());
  }

  Future<void> insertSearchHistory(SearchHistoryModel model) {
    return into(searchHistoryTable).insert(_toCompanion(model));
  }

  Future<void> deleteSearchHistory(SearchHistoryModel model) {
    return (delete(searchHistoryTable)..where((t) => t.id.equals(model.id!)))
        .go();
  }

  Future<void> clearSearchHistory() {
    return delete(searchHistoryTable).go();
  }

  SearchHistoryModel _toModel(SearchHistoryTableData row) => SearchHistoryModel(
        id: row.id,
        search: row.search,
        article: row.article,
        createdAt: row.createdAt,
      );

  SearchHistoryTableCompanion _toCompanion(SearchHistoryModel m) =>
      SearchHistoryTableCompanion(
        id: m.id != null ? Value(m.id!) : const Value.absent(),
        search: Value(m.search),
        article: Value(m.article),
        createdAt: Value(m.createdAt),
      );
}
