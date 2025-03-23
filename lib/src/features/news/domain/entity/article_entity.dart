import 'package:buzzwire/src/features/news/domain/entity/source_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ArticleEntity extends Equatable {
  int? id;
  final SourceEntity? source;
  final String? author;
  final String? title;
  final String? description;
  final String? articleUrl;
  final String? image;
  final String? publishedAt;
  final String? content;
  bool isSaved;

  ArticleEntity({
    this.id,
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.articleUrl,
    required this.image,
    required this.publishedAt,
    required this.content,
    this.isSaved = false,
  });

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        articleUrl,
        image,
        publishedAt,
        content,
      ];
}
