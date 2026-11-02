import 'dart:async';
import 'dart:convert';

import 'package:buzzwire/core/cache/buzzwire_app_cache.dart';
import 'package:buzzwire/core/cache/constant/preference_keys.dart';
import 'package:buzzwire/core/common/utils/reusable_stream_controller.dart';
import 'package:buzzwire/core/data/datasource/profile/profle_local_datasource.dart';
import 'package:buzzwire/core/data/model/user_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final BuzzWireAppCache pref;
  final _userStreamController = ReusableStreamController<UserModel?>();

  ProfileLocalDataSourceImpl({required this.pref});

  @override
  Future<void> clearUser() async {
    await pref.remove(userKey);
    _userStreamController.add(null);
  }

  @override
  Future<UserModel?> getUser() async {
    String? userModelJsonString = await pref.getString(userKey);

    if (userModelJsonString != null) {
      final userModelJson = jsonDecode(userModelJsonString);
      return UserModel.fromJson(userModelJson);
    }
    return null;
  }

  @override
  Future<void> saveUser(UserModel userModel) async {
    final userModelJsonString = jsonEncode(userModel.toJson());
    await pref.saveString(userKey, userModelJsonString);
    _userStreamController.add(userModel);
  }

  @override
  Stream<UserModel?> get userStream async* {
    final user = await getUser();
    _userStreamController.add(user);
    yield* _userStreamController.stream;
  }

  @override
  void disposeUserStream() {
    _userStreamController.close();
  }
}
