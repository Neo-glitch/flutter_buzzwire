import 'dart:async';

import 'package:buzzwire/core/database/dao/article_dao.dart';
import 'package:buzzwire/src/features/news/data/model/local_article_model.dart';
import 'package:buzzwire/core/database/dao/search_history_dao.dart';
import 'package:buzzwire/src/features/search_history/data/model/search_history_model.dart';
import 'package:buzzwire/core/database/converter/date_time_converter.dart';
import 'package:buzzwire/core/database/converter/local_article_model_converter.dart';
import 'package:buzzwire/core/database/converter/source_model_converter.dart';
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
