import 'package:buzzwire/core/database/converter/date_time_converter.dart';
import 'package:buzzwire/core/database/converter/local_source_model_converter.dart';
import 'package:drift/drift.dart';

class SavedNewsTable extends Table {
  @override
  String get tableName => 'saved_news';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get savedAt => integer().map(const DateTimeConverter())();
  TextColumn get source =>
      text().nullable().map(const LocalSourceModelConverter())();
  TextColumn get author => text().nullable()();
  TextColumn get title => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get url => text().nullable()();
  TextColumn get urlToImage => text().nullable()();
  TextColumn get publishedAt => text().nullable()();
  TextColumn get content => text().nullable()();
}
