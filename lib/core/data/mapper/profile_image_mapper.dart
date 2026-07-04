import 'package:buzzwire/core/data/model/profile_image_model.dart';
import 'package:buzzwire/core/domain/entity/profile_image_entity.dart';

class ProfileImageMapper {
  ProfileImageMapper._();

  static ProfileImageEntity? fromModel(ProfileImageModel? model) {
    if (model == null) return null;
    return ProfileImageEntity(
      fileId: model.fileId,
      imageUrl: model.imageUrl,
    );
  }

  static ProfileImageModel? fromEntity(ProfileImageEntity? entity) {
    if (entity == null) return null;
    return ProfileImageModel(fileId: entity.fileId, imageUrl: entity.imageUrl);
  }
}
