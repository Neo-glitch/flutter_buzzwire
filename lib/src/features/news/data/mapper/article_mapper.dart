import 'package:buzzwire/src/features/news/data/mapper/source_mapper.dart';
import 'package:buzzwire/src/features/news/data/model/article_model.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';

class ArticleMapper {
  ArticleMapper._();

  static ArticleEntity toEntity(ArticleModel model) => ArticleEntity(
      source: SourceMapper.toEntity(model.source),
      author: model.author,
      title: model.title,
      description: model.description,
      articleUrl: model.url,
      image: model.urlToImage,
      publishedAt: model.publishedAt,
      content: model.content);

  static List<ArticleEntity>? toEntities(List<ArticleModel>? articles) {
    if (articles == null) return null;
    List<ArticleEntity> entities = [];
    for (var article in articles) {
      entities.add(toEntity(article));
    }
    return entities;
  }

  static ArticleModel fromEntity(ArticleEntity entity) => ArticleModel(
      source: SourceMapper.fromEntity(entity.source),
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.articleUrl,
      urlToImage: entity.image,
      publishedAt: entity.publishedAt,
      content: entity.content);

  static List<ArticleModel>? fromEntities(List<ArticleEntity>? articles) {
    if (articles == null) return null;
    List<ArticleModel> result = [];
    for (var article in articles) {
      result.add(fromEntity(article));
    }
    return result;
  }
}
