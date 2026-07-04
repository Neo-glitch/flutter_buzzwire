import 'dart:io';

import 'package:buzzwire/core/data/model/profile_image_model.dart';
import 'package:buzzwire/core/data/model/user_model.dart';

abstract class ProfileRemoteDataSource {
  Future<void> createUser(UserModel userModel);
  Future<void> updateUser(UserModel userModel);
  Future<UserModel?> getUser(String userId);
  Future<void> deleteUser(UserModel userModel);
  Future<ProfileImageModel> uploadProfileImage(UserModel userModel, File image);
}
