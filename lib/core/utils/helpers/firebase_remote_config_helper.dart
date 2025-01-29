import 'package:buzzwire/core/constants/firebase_remote_config_keys.dart';
import 'package:buzzwire/core/utils/logging/logger_helper.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigHelper {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  static FirebaseRemoteConfigHelper? _instance;

  static FirebaseRemoteConfigHelper get instance =>
      _instance ??= FirebaseRemoteConfigHelper();

  Future<void> init() async {
    await _setConfigSettings();
    await _setDefaults();
    await _fetchAndActivate();
  }

  Future<void> _setConfigSettings() async => _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 20),
          minimumFetchInterval: const Duration(seconds: 5),
        ),
      );

  Future<void> _setDefaults() async => _remoteConfig.setDefaults(
        const {
          FirebaseRemoteConfigKeys.minAppVersion: 1,
        },
      );

  Future<void> _fetchAndActivate() async {
    bool updated = await _remoteConfig.fetchAndActivate();

    if (updated) {
      BuzzWireLoggerHelper.debug('The config has been updated.');
    } else {
      BuzzWireLoggerHelper.debug('The config is not updated..');
    }
  }

  int get minAppVerision => _getInt(FirebaseRemoteConfigKeys.minAppVersion);

  String _getString(String key) => _remoteConfig.getString(key);
  bool _getBool(String key) => _remoteConfig.getBool(key);
  int _getInt(String key) => _remoteConfig.getInt(key);
  double _getDouble(String key) => _remoteConfig.getDouble(key);
}
