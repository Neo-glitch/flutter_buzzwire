import 'package:buzzwire/src/shared/data/model/country_model.dart';
import 'package:buzzwire/src/shared/domain/entity/country_entity.dart';

class CountryMapper {
  CountryMapper._();

  static CountryEntity? fromModel(CountryModel? model) {
    if (model == null) return null;

    return CountryEntity(name: model.name, code: model.code);
  }

  static CountryModel? fromEntity(CountryEntity? entity) {
    if (entity == null) return null;
    return CountryModel(name: entity.name, code: entity.code);
  }
}
