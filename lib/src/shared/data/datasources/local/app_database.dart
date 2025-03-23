import 'dart:async';

import 'package:buzzwire/src/features/news/data/datasources/local/article_dao.dart';
import 'package:buzzwire/src/features/news/data/model/local_article_model.dart';
import 'package:buzzwire/src/features/search_history/data/datasources/local/search_history_dao.dart';
import 'package:buzzwire/src/features/search_history/data/model/search_history_model.dart';
import 'package:buzzwire/src/shared/data/datasources/local/date_time_converter.dart';
import 'package:buzzwire/src/shared/data/datasources/local/local_article_model_converter.dart';
import 'package:buzzwire/src/shared/data/datasources/local/source_model_converter.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@TypeConverters(
    [LocalArticleModelConverter, DateTimeConverter, SourceModelConverter])
@Database(version: 1, entities: [SearchHistoryModel, LocalArticleModel])
abstract class AppDatabase extends FloorDatabase {
  SearchHistoryDao get searchHistoryDao;
  ArticleDao get newsDao;
}
