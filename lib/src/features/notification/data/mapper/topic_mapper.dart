import 'package:buzzwire/src/features/notification/data/model/topic_model.dart';
import 'package:buzzwire/src/features/notification/domain/entity/topic_entity.dart';

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
