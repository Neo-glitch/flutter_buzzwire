import 'package:injectable/injectable.dart';

import '../firebase_remote_config_helper.dart';

@module
abstract class ConfigModule {
  @preResolve
  @lazySingleton
  Future<FirebaseRemoteConfigHelper> remoteConfigHelper() async {
    final helper = FirebaseRemoteConfigHelper.instance;
    await helper.init();
    return helper;
  }
}
