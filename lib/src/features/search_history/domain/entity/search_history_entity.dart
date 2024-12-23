import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';

class SearchHistoryEntity {
  final String? search;
  final ArticleEntity? article;

  SearchHistoryEntity({this.search, this.article});
}
