import 'package:buzzwire/core/database/app_database.dart';
import 'package:buzzwire/core/database/model/local_article_model.dart';
import 'package:buzzwire/core/database/table/saved_news_table.dart';
import 'package:drift/drift.dart';

part 'article_dao.g.dart';

@DriftAccessor(tables: [SavedNewsTable])
class ArticleDao extends DatabaseAccessor<AppDatabase>
    with _$ArticleDaoMixin {
  ArticleDao(super.db);

  Future<int?> getSavedArticlesItemCount() async {
    final count = countAll();
    final query = selectOnly(savedNewsTable)..addColumns([count]);
    return (await query.getSingle()).read(count);
  }

  Future<List<LocalArticleModel>> getPaginatedSavedArticle(
      int pageSize, int pageOffset) async {
    final rows = await (select(savedNewsTable)
          ..orderBy([(t) => OrderingTerm.desc(t.savedAt)])
          ..limit(pageSize, offset: pageOffset))
        .get();
    return rows.map(_toModel).toList();
  }

  Stream<List<LocalArticleModel>> getSavedArticles() {
    return (select(savedNewsTable)
          ..orderBy([(t) => OrderingTerm.desc(t.savedAt)]))
        .watch()
        .map((rows) => rows.map(_toModel).toList());
  }

  Future<void> saveArticle(LocalArticleModel article) {
    return into(savedNewsTable).insert(_toCompanion(article));
  }

  Future<void> deleteSavedArticle(LocalArticleModel article) {
    return (delete(savedNewsTable)..where((t) => t.id.equals(article.id!)))
        .go();
  }

  Future<void> clearAllSavedArticles() {
    return delete(savedNewsTable).go();
  }

  LocalArticleModel _toModel(SavedNewsTableData row) => LocalArticleModel(
        id: row.id,
        savedAt: row.savedAt,
        source: row.source,
        author: row.author,
        title: row.title,
        description: row.description,
        url: row.url,
        urlToImage: row.urlToImage,
        publishedAt: row.publishedAt,
        content: row.content,
      );

  SavedNewsTableCompanion _toCompanion(LocalArticleModel a) =>
      SavedNewsTableCompanion(
        id: a.id != null ? Value(a.id!) : const Value.absent(),
        savedAt: Value(a.savedAt),
        source: Value(a.source),
        author: Value(a.author),
        title: Value(a.title),
        description: Value(a.description),
        url: Value(a.url),
        urlToImage: Value(a.urlToImage),
        publishedAt: Value(a.publishedAt),
        content: Value(a.content),
      );
}
