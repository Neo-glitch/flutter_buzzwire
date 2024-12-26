import 'package:buzzwire/src/features/news/data/mapper/article_mapper.dart';
import 'package:buzzwire/src/features/news/data/model/news_model.dart';
import 'package:buzzwire/src/features/news/domain/entity/news_entity.dart';

class NewsMapper {
  NewsMapper._();

  static NewsEntity toEntity(NewsModel model) {
    return NewsEntity(
      totalResults: model.totalResults,
      articles: ArticleMapper.toEntitiesFromArticleModel(model.articles),
    );
  }
}
