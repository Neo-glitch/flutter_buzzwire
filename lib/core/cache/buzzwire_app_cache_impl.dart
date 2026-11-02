import 'dart:convert';

import 'package:buzzwire/core/cache/buzzwire_app_cache.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

/// [BuzzWireAppCache] backed directly by [FlutterSecureStorage]. Every read
/// and write goes to secure storage; everything is stored as a string.
@LazySingleton(as: BuzzWireAppCache)
class BuzzWireAppCacheImpl implements BuzzWireAppCache {
  final FlutterSecureStorage _secureStorage;

  BuzzWireAppCacheImpl({required FlutterSecureStorage secureStorage})
      : _secureStorage = secureStorage;

  @override
  Future<bool> saveString(String key, String value) => _write(key, value);

  @override
  Future<String?> getString(String key) => _secureStorage.read(key: key);

  @override
  Future<bool> saveInt(String key, int value) => _write(key, value.toString());

  @override
  Future<int?> getInt(String key) async =>
      int.tryParse(await _secureStorage.read(key: key) ?? '');

  @override
  Future<bool> saveDouble(String key, double value) =>
      _write(key, value.toString());

  @override
  Future<double?> getDouble(String key) async =>
      double.tryParse(await _secureStorage.read(key: key) ?? '');

  @override
  Future<bool> saveBool(String key, bool value) =>
      _write(key, value.toString());

  @override
  Future<bool?> getBool(String key) async =>
      switch (await _secureStorage.read(key: key)) {
        'true' => true,
        'false' => false,
        _ => null,
      };

  @override
  Future<bool> saveStringList(String key, List<String> value) =>
      _write(key, jsonEncode(value));

  @override
  Future<List<String>?> getStringList(String key) async {
    final raw = await _secureStorage.read(key: key);
    if (raw == null) return null;
    try {
      return (jsonDecode(raw) as List).cast<String>();
    } on Object {
      return null;
    }
  }

  @override
  Future<bool> remove(String key) async {
    await _secureStorage.delete(key: key);
    return true;
  }

  @override
  Future<bool> clear() async {
    await _secureStorage.deleteAll();
    return true;
  }

  Future<bool> _write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
    return true;
  }
}
