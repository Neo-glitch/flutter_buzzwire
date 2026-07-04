import 'dart:convert';

import 'package:buzzwire/core/database/model/local_source_model.dart';
import 'package:floor/floor.dart';

class LocalSourceModelConverter extends TypeConverter<LocalSourceModel?, String?> {
  @override
  LocalSourceModel? decode(String? databaseValue) {
    if (databaseValue == null) return null;
    final sourceModelJson =
        Map<String, dynamic>.from(jsonDecode(databaseValue));
    return LocalSourceModel.fromJson(sourceModelJson);
  }

  @override
  String? encode(LocalSourceModel? value) {
    if (value == null) return null;
    return jsonEncode(value.toJson());
  }
}
