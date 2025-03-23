import 'package:buzzwire/src/features/news/data/model/source_model.dart';
import 'package:buzzwire/src/features/news/domain/entity/source_entity.dart';

class SourceMapper {
  SourceMapper._();

  static SourceEntity toEntity(SourceModel? model) =>
      SourceEntity(id: model?.id, name: model?.name);

  static List<SourceEntity>? toEntitites(List<SourceModel>? sources) {
    if (sources == null) return null;
    List<SourceEntity> result = [];
    for (var source in sources) {
      result.add(toEntity(source));
    }
    return result;
  }

  static SourceModel fromEntity(SourceEntity? entity) =>
      SourceModel(id: entity?.id, name: entity?.name);

  static List<SourceModel>? fromEntitites(List<SourceEntity>? sources) {
    if (sources == null) return null;

    List<SourceModel> results = [];
    for (var source in sources) {
      results.add(fromEntity(source));
    }
    return results;
  }
}
