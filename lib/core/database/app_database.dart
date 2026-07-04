import 'package:buzzwire/core/database/converter/date_time_converter.dart';
import 'package:buzzwire/core/database/converter/local_article_model_converter.dart';
import 'package:buzzwire/core/database/converter/local_source_model_converter.dart';
import 'package:buzzwire/core/database/dao/article_dao.dart';
import 'package:buzzwire/core/database/dao/search_history_dao.dart';
import 'package:buzzwire/core/database/model/local_article_model.dart';
import 'package:buzzwire/core/database/model/local_source_model.dart';
import 'package:buzzwire/core/database/table/saved_news_table.dart';
import 'package:buzzwire/core/database/table/search_history_table.dart';
import 'package:drift/drift.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [SavedNewsTable, SearchHistoryTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from == 1) {
            // Migrate Floor schema (camelCase columns) to Drift schema (snake_case columns).
            await customStatement(
                'ALTER TABLE saved_news RENAME TO _saved_news_old');
            await m.createTable(savedNewsTable);
            await customStatement('''
              INSERT INTO saved_news
                (id, saved_at, source, author, title, description,
                 url, url_to_image, published_at, content)
              SELECT id, savedAt, source, author, title, description,
                 url, urlToImage, publishedAt, content
              FROM _saved_news_old
            ''');
            await customStatement('DROP TABLE _saved_news_old');

            await customStatement(
                'ALTER TABLE search_history RENAME TO _search_history_old');
            await m.createTable(searchHistoryTable);
            await customStatement('''
              INSERT INTO search_history (id, search, article, created_at)
              SELECT id, search, article, createdAt
              FROM _search_history_old
            ''');
            await customStatement('DROP TABLE _search_history_old');
          }
        },
      );

  ArticleDao get newsDao => ArticleDao(this);
  SearchHistoryDao get searchHistoryDao => SearchHistoryDao(this);
}
