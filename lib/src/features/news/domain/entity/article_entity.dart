import 'package:buzzwire/src/features/news/domain/entity/source_entity.dart';

class ArticleEntity {
  final SourceEntity? source;
  final String? author;
  final String? title;
  final String? description;
  final String? articleUrl;
  final String? image;
  final String? publishedAt;
  final String? content;

  ArticleEntity(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.articleUrl,
      required this.image,
      required this.publishedAt,
      required this.content});
}
