import 'package:buzzwire/core/database/converter/date_time_converter.dart';
import 'package:buzzwire/core/database/converter/local_article_model_converter.dart';
import 'package:drift/drift.dart';

class SearchHistoryTable extends Table {
  @override
  String get tableName => 'search_history';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get search => text().nullable()();
  TextColumn get article =>
      text().nullable().map(const LocalArticleModelConverter())();
  IntColumn get createdAt => integer().map(const DateTimeConverter())();
}
