// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalArticleModel _$LocalArticleModelFromJson(Map<String, dynamic> json) =>
    LocalArticleModel(
      id: (json['id'] as num?)?.toInt(),
      savedAt: DateTime.parse(json['savedAt'] as String),
      source: json['source'] == null
          ? null
          : SourceModel.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$LocalArticleModelToJson(LocalArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'savedAt': instance.savedAt.toIso8601String(),
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
