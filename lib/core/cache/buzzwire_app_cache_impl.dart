import 'package:buzzwire/core/cache/buzzwire_app_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuzzWireAppCacheImpl implements BuzzWireAppCache {
  final SharedPreferences _preferences;

  BuzzWireAppCacheImpl({required SharedPreferences preferences})
      : _preferences = preferences;

  @override
  Future<bool> saveString(String key, String value) =>
      _preferences.setString(key, value);

  @override
  String? getString(String key) => _preferences.getString(key);

  @override
  Future<bool> saveInt(String key, int value) =>
      _preferences.setInt(key, value);

  @override
  int? getInt(String key) => _preferences.getInt(key);

  @override
  Future<bool> saveDouble(String key, double value) =>
      _preferences.setDouble(key, value);

  @override
  double? getDouble(String key) => _preferences.getDouble(key);

  @override
  Future<bool> saveBool(String key, bool value) =>
      _preferences.setBool(key, value);

  @override
  bool? getBool(String key) => _preferences.getBool(key);

  @override
  Future<bool> saveStringList(String key, List<String> value) =>
      _preferences.setStringList(key, value);

  @override
  List<String>? getStringList(String key) => _preferences.getStringList(key);

  @override
  Future<bool> remove(String key) => _preferences.remove(key);

  @override
  Future<bool> clear() => _preferences.clear();
}
