import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';

class SearchHistoryEntity {
  final int? id;
  final String? search;
  final ArticleEntity? article;

  SearchHistoryEntity({this.id, this.search, this.article});
}
