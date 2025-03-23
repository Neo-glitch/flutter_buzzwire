import 'package:buzzwire/src/features/news/data/mapper/article_mapper.dart';
import 'package:buzzwire/src/features/news/data/model/local_article_model.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/search_history/data/model/search_history_model.dart';
import 'package:buzzwire/src/features/search_history/domain/entity/search_history_entity.dart';

class SearchHistoryMapper {
  SearchHistoryMapper._();

  static SearchHistoryEntity fromModel(SearchHistoryModel model) {
    ArticleEntity? article;
    if (model.article != null) {
      article = ArticleMapper.fromLocalArticleModel(model.article!);
    }

    return SearchHistoryEntity(
      id: model.id,
      search: model.search,
      article: article,
    );
  }

  static SearchHistoryModel toModel(SearchHistoryEntity entity) {
    LocalArticleModel? article;
    if (entity.article != null) {
      article = ArticleMapper.toLocalArticleModel(entity.article!);
    }

    return SearchHistoryModel(
      id: entity.id,
      createdAt: DateTime.now(),
      search: entity.search,
      article: article,
    );
  }

  static List<SearchHistoryEntity> toEntities(List<SearchHistoryModel> models) {
    final List<SearchHistoryEntity> entities = [];
    for (var model in models) {
      entities.add(fromModel(model));
    }
    return entities;
  }
}
