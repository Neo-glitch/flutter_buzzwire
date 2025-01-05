import 'dart:async';
import 'dart:convert';

import 'package:buzzwire/core/constants/preference_keys.dart';
import 'package:buzzwire/core/utils/local_storage/shared_preference_util.dart';
import 'package:buzzwire/src/shared/data/model/user_model.dart';
import 'package:buzzwire/src/shared/data/utils/reusable_stream_controller.dart';

abstract class ProfileLocalDataSource {
  Future<void> saveUser(UserModel userModel);
  Future<void> clearUser();
  UserModel? getUser();
  Stream<UserModel?> get userStream;
  void disposeUserStream();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final BuzzWireSharedPref pref;
  final _userStreamController = ReusableStreamController<UserModel?>();

  ProfileLocalDataSourceImpl({required this.pref});
  @override
  Future<void> clearUser() async {
    await pref.remove(userKey);
    _userStreamController.add(null);
  }

  @override
  UserModel? getUser() {
    String? userModelJsonString = pref.getString(userKey);

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
  Stream<UserModel?> get userStream {
    final user = getUser();
    _userStreamController.add(user);
    return _userStreamController.stream;
  }

  @override
  void disposeUserStream() {
    _userStreamController.close();
  }
}
