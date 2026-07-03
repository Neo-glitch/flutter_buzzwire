import 'dart:convert';

import 'package:buzzwire/src/features/news/data/model/source_model.dart';
import 'package:floor/floor.dart';

class SourceModelConverter extends TypeConverter<SourceModel?, String?> {
  @override
  SourceModel? decode(String? databaseValue) {
    if (databaseValue == null) return null;
    final sourceModelJson =
        Map<String, dynamic>.from(jsonDecode(databaseValue));
    return SourceModel.fromJson(sourceModelJson);
  }

  @override
  String? encode(SourceModel? value) {
    if (value == null) return null;
    return jsonEncode(value.toJson());
  }
}
