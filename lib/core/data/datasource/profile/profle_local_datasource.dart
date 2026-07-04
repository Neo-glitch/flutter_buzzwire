import 'package:buzzwire/core/data/model/user_model.dart';

abstract class ProfileLocalDataSource {
  Future<void> saveUser(UserModel userModel);
  Future<void> clearUser();
  UserModel? getUser();
  Stream<UserModel?> get userStream;
  void disposeUserStream();
}
