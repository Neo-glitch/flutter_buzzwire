import 'package:buzzwire/src/features/news/data/mapper/source_mapper.dart';
import 'package:buzzwire/src/features/news/data/model/article_model.dart';
import 'package:buzzwire/src/features/news/data/model/local_article_model.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';

class ArticleMapper {
  ArticleMapper._();

  /// for remote narticle model
  static ArticleEntity fromArticleModel(ArticleModel model) => ArticleEntity(
        source: SourceMapper.toEntity(model.source),
        author: model.author,
        title: model.title,
        description: model.description,
        articleUrl: model.url,
        image: model.urlToImage,
        publishedAt: model.publishedAt,
        content: model.content,
      );

  static ArticleModel toArticleModel(ArticleEntity entity) => ArticleModel(
        source: SourceMapper.fromEntity(entity.source),
        author: entity.author,
        title: entity.title,
        description: entity.description,
        url: entity.articleUrl,
        urlToImage: entity.image,
        publishedAt: entity.publishedAt,
        content: entity.content,
      );

  static List<ArticleEntity>? toEntitiesFromArticleModel(
      List<ArticleModel>? articles) {
    if (articles == null) return null;
    List<ArticleEntity> entities = [];
    for (var article in articles) {
      entities.add(fromArticleModel(article));
    }
    return entities;
  }

  static List<ArticleModel>? fromEntitiesToArticleModel(
      List<ArticleEntity>? articles) {
    if (articles == null) return null;
    List<ArticleModel> result = [];
    for (var article in articles) {
      result.add(toArticleModel(article));
    }
    return result;
  }

  /// For local article model
  static ArticleEntity fromLocalArticleModel(LocalArticleModel model) =>
      ArticleEntity(
        id: model.id,
        source: SourceMapper.toEntity(model.source),
        author: model.author,
        title: model.title,
        description: model.description,
        articleUrl: model.url,
        image: model.urlToImage,
        publishedAt: model.publishedAt,
        content: model.content,
      );

  static LocalArticleModel toLocalArticleModel(ArticleEntity entity) =>
      LocalArticleModel(
        id: entity.id,
        savedAt: DateTime.now(),
        source: SourceMapper.fromEntity(entity.source),
        author: entity.author,
        title: entity.title,
        description: entity.description,
        url: entity.articleUrl,
        urlToImage: entity.image,
        publishedAt: entity.publishedAt,
        content: entity.content,
      );

  static List<ArticleEntity>? toEntitiesFromLocalArticleModel(
      List<LocalArticleModel>? articles) {
    if (articles == null) return null;
    List<ArticleEntity> entities = [];
    for (var article in articles) {
      entities.add(fromLocalArticleModel(article));
    }
    return entities;
  }

  static List<LocalArticleModel>? fromEntitiesToLocalArticleModel(
      List<ArticleEntity>? articles) {
    if (articles == null) return null;
    List<LocalArticleModel> result = [];
    for (var article in articles) {
      result.add(toLocalArticleModel(article));
    }
    return result;
  }
}
