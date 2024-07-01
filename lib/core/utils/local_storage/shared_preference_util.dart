import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preference_util.g.dart';

// note: can have an injection file to handle all this provider creation and all

// final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
//   throw UnimplementedError();
// });

@riverpod
SharedPreferences preferences(PreferencesRef ref) {
  throw UnimplementedError();
}

@Riverpod(keepAlive: true)
BuzzWireSharedPref buzzWireSharedPref(BuzzWireSharedPrefRef ref) {
  return BuzzWireSharedPref(preferences: ref.read(preferencesProvider));
}

class BuzzWireSharedPref {
  final SharedPreferences _preferences;

  BuzzWireSharedPref({required SharedPreferences preferences})
      : _preferences = preferences;

  Future<bool> saveString(String key, String value) async {
    return _preferences.setString(key, value);
  }

  String? getString(String key) {
    return _preferences.getString(key);
  }

  Future<bool> saveInt(String key, int value) async {
    return _preferences.setInt(key, value);
  }

  int? getInt(String key) {
    return _preferences.getInt(key);
  }

  Future<bool> saveDouble(String key, double value) async {
    return _preferences.setDouble(key, value);
  }

  double? getDouble(String key) => _preferences.getDouble(key);

  Future<bool> saveBool(String key, bool value) async {
    return _preferences.setBool(key, value);
  }

  bool? getBool(String key) {
    return _preferences.getBool(key);
  }

  Future<bool> saveStringList(String key, List<String> value) async {
    return _preferences.setStringList(key, value);
  }

  List<String>? getStringList(String key) {
    return _preferences.getStringList(key);
  }

  Future<bool> remove(String key) async {
    return _preferences.remove(key);
  }

  Future<bool> clear() async {
    return _preferences.clear();
  }
}
