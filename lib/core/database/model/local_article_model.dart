import 'package:buzzwire/core/database/model/local_source_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'local_article_model.g.dart';

@JsonSerializable()
class LocalArticleModel {
  final int? id;
  final DateTime savedAt;
  final LocalSourceModel? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const LocalArticleModel({
    this.id,
    required this.savedAt,
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @override
  String toString() {
    return 'Article(source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
  }

  factory LocalArticleModel.fromJson(Map<String, dynamic> json) {
    return _$LocalArticleModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocalArticleModelToJson(this);

  LocalArticleModel copyWith({
    int? id,
    DateTime? savedAt,
    LocalSourceModel? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) {
    return LocalArticleModel(
      id: id ?? this.id,
      savedAt: savedAt ?? this.savedAt,
      source: source ?? this.source,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }
}
