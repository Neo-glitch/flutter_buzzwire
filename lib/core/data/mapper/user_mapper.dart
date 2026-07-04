import 'package:buzzwire/core/data/mapper/country_mapper.dart';
import 'package:buzzwire/core/data/mapper/profile_image_mapper.dart';
import 'package:buzzwire/core/data/model/user_model.dart';
import 'package:buzzwire/core/domain/entity/user_entity.dart';

class UserMapper {
  UserMapper._();

  static UserEntity? fromModel(UserModel? model) {
    if (model == null) return null;
    return UserEntity(
      userId: model.userId,
      email: model.email,
      userName: model.userName,
      topicsFollowing: model.topicsFollowing,
      country: CountryMapper.fromModel(model.country),
      phoneNumber: model.phoneNumber,
      profileImage: ProfileImageMapper.fromModel(model.profileImage),
    );
  }

  static UserModel? fromEntity(UserEntity? entity) {
    if (entity == null) return null;
    return UserModel(
      userId: entity.userId,
      email: entity.email,
      userName: entity.userName,
      topicsFollowing: entity.topicsFollowing,
      country: CountryMapper.fromEntity(entity.country),
      phoneNumber: entity.phoneNumber,
      profileImage: ProfileImageMapper.fromEntity(entity.profileImage),
    );
  }
}
