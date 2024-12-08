import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';

class NewsEntity {
  final int? totalResults;
  final List<ArticleEntity>? articles;

  NewsEntity({required this.totalResults, required this.articles});
}
