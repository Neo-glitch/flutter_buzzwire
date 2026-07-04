import 'package:buzzwire/core/data/model/topic_model.dart';
import 'package:buzzwire/core/domain/entity/topic_entity.dart';

class TopicMapper {
  TopicMapper._();

  static TopicEntity fromModel(TopicModel model) {
    return TopicEntity(
      title: model.title,
      imageUrl: model.imageUrl,
    );
  }

  static TopicModel fromEntity(TopicEntity entity) {
    return TopicModel(
      title: entity.title,
      imageUrl: entity.imageUrl,
    );
  }
}
