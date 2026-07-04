import 'dart:convert';

import 'package:buzzwire/core/database/model/local_source_model.dart';
import 'package:drift/drift.dart';

class LocalSourceModelConverter
    extends TypeConverter<LocalSourceModel?, String?> {
  const LocalSourceModelConverter();

  @override
  LocalSourceModel? fromSql(String? fromDb) {
    if (fromDb == null) return null;
    return LocalSourceModel.fromJson(
        Map<String, dynamic>.from(jsonDecode(fromDb)));
  }

  @override
  String? toSql(LocalSourceModel? value) {
    if (value == null) return null;
    return jsonEncode(value.toJson());
  }
}
