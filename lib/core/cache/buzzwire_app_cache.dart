abstract interface class BuzzWireAppCache {
  Future<bool> saveString(String key, String value);
  String? getString(String key);

  Future<bool> saveInt(String key, int value);
  int? getInt(String key);

  Future<bool> saveDouble(String key, double value);
  double? getDouble(String key);

  Future<bool> saveBool(String key, bool value);
  bool? getBool(String key);

  Future<bool> saveStringList(String key, List<String> value);
  List<String>? getStringList(String key);

  Future<bool> remove(String key);
  Future<bool> clear();
}
