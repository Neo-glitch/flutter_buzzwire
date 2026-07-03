// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  SearchHistoryDao? _searchHistoryDaoInstance;

  ArticleDao? _newsDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `search_history` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `search` TEXT, `article` TEXT, `createdAt` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `saved_news` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `savedAt` INTEGER NOT NULL, `source` TEXT, `author` TEXT, `title` TEXT, `description` TEXT, `url` TEXT, `urlToImage` TEXT, `publishedAt` TEXT, `content` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  SearchHistoryDao get searchHistoryDao {
    return _searchHistoryDaoInstance ??=
        _$SearchHistoryDao(database, changeListener);
  }

  @override
  ArticleDao get newsDao {
    return _newsDaoInstance ??= _$ArticleDao(database, changeListener);
  }
}

class _$SearchHistoryDao extends SearchHistoryDao {
  _$SearchHistoryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _searchHistoryModelInsertionAdapter = InsertionAdapter(
            database,
            'search_history',
            (SearchHistoryModel item) => <String, Object?>{
                  'id': item.id,
                  'search': item.search,
                  'article': _localArticleModelConverter.encode(item.article),
                  'createdAt': _dateTimeConverter.encode(item.createdAt)
                },
            changeListener),
        _searchHistoryModelDeletionAdapter = DeletionAdapter(
            database,
            'search_history',
            ['id'],
            (SearchHistoryModel item) => <String, Object?>{
                  'id': item.id,
                  'search': item.search,
                  'article': _localArticleModelConverter.encode(item.article),
                  'createdAt': _dateTimeConverter.encode(item.createdAt)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SearchHistoryModel>
      _searchHistoryModelInsertionAdapter;

  final DeletionAdapter<SearchHistoryModel> _searchHistoryModelDeletionAdapter;

  @override
  Stream<List<SearchHistoryModel>> getSearchHistory() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM search_history ORDER BY createdAt DESC',
        mapper: (Map<String, Object?> row) => SearchHistoryModel(
            id: row['id'] as int?,
            createdAt: _dateTimeConverter.decode(row['createdAt'] as int),
            search: row['search'] as String?,
            article:
                _localArticleModelConverter.decode(row['article'] as String?)),
        queryableName: 'search_history',
        isView: false);
  }

  @override
  Future<void> clearSearchHistory() async {
    await _queryAdapter.queryNoReturn('DELETE FROM search_history');
  }

  @override
  Future<void> insertSearchHistory(
      SearchHistoryModel searchHistoryModel) async {
    await _searchHistoryModelInsertionAdapter.insert(
        searchHistoryModel, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSearchHistory(
      SearchHistoryModel searchHistoryModel) async {
    await _searchHistoryModelDeletionAdapter.delete(searchHistoryModel);
  }
}

class _$ArticleDao extends ArticleDao {
  _$ArticleDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _localArticleModelInsertionAdapter = InsertionAdapter(
            database,
            'saved_news',
            (LocalArticleModel item) => <String, Object?>{
                  'id': item.id,
                  'savedAt': _dateTimeConverter.encode(item.savedAt),
                  'source': _sourceModelConverter.encode(item.source),
                  'author': item.author,
                  'title': item.title,
                  'description': item.description,
                  'url': item.url,
                  'urlToImage': item.urlToImage,
                  'publishedAt': item.publishedAt,
                  'content': item.content
                },
            changeListener),
        _localArticleModelDeletionAdapter = DeletionAdapter(
            database,
            'saved_news',
            ['id'],
            (LocalArticleModel item) => <String, Object?>{
                  'id': item.id,
                  'savedAt': _dateTimeConverter.encode(item.savedAt),
                  'source': _sourceModelConverter.encode(item.source),
                  'author': item.author,
                  'title': item.title,
                  'description': item.description,
                  'url': item.url,
                  'urlToImage': item.urlToImage,
                  'publishedAt': item.publishedAt,
                  'content': item.content
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<LocalArticleModel> _localArticleModelInsertionAdapter;

  final DeletionAdapter<LocalArticleModel> _localArticleModelDeletionAdapter;

  @override
  Future<int?> getSavedArticlesItemCount() async {
    return _queryAdapter.query('SELECT COUNT(*) FROM saved_news',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<LocalArticleModel>> getPaginatedSavedArticle(
    int pageSize,
    int pageOffset,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM saved_news ORDER BY savedAt DESC LIMIT ?1 OFFSET ?2',
        mapper: (Map<String, Object?> row) => LocalArticleModel(
            id: row['id'] as int?,
            savedAt: _dateTimeConverter.decode(row['savedAt'] as int),
            source: _sourceModelConverter.decode(row['source'] as String?),
            author: row['author'] as String?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            url: row['url'] as String?,
            urlToImage: row['urlToImage'] as String?,
            publishedAt: row['publishedAt'] as String?,
            content: row['content'] as String?),
        arguments: [pageSize, pageOffset]);
  }

  @override
  Stream<List<LocalArticleModel>> getSavedArticles() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM saved_news ORDER BY savedAt DESC',
        mapper: (Map<String, Object?> row) => LocalArticleModel(
            id: row['id'] as int?,
            savedAt: _dateTimeConverter.decode(row['savedAt'] as int),
            source: _sourceModelConverter.decode(row['source'] as String?),
            author: row['author'] as String?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            url: row['url'] as String?,
            urlToImage: row['urlToImage'] as String?,
            publishedAt: row['publishedAt'] as String?,
            content: row['content'] as String?),
        queryableName: 'saved_news',
        isView: false);
  }

  @override
  Future<void> clearAllSavedArticles() async {
    await _queryAdapter.queryNoReturn('DELETE FROM saved_news');
  }

  @override
  Future<void> saveArticle(LocalArticleModel article) async {
    await _localArticleModelInsertionAdapter.insert(
        article, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSavedArticle(LocalArticleModel article) async {
    await _localArticleModelDeletionAdapter.delete(article);
  }
}

// ignore_for_file: unused_element
final _localArticleModelConverter = LocalArticleModelConverter();
final _dateTimeConverter = DateTimeConverter();
final _sourceModelConverter = SourceModelConverter();
