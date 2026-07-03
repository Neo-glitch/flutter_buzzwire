import 'package:buzzwire/core/data/model/country_model.dart';
import 'package:buzzwire/core/domain/entity/country_entity.dart';

class CountryMapper {
  CountryMapper._();

  static CountryEntity fromModel(CountryModel model) {
    return CountryEntity(name: model.name, code: model.code);
  }

  static CountryModel fromEntity(CountryEntity entity) {
    return CountryModel(name: entity.name, code: entity.code);
  }
}
