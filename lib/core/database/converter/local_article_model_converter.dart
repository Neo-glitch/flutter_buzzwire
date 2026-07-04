import 'dart:convert';

import 'package:buzzwire/core/database/model/local_article_model.dart';
import 'package:drift/drift.dart';

class LocalArticleModelConverter
    extends TypeConverter<LocalArticleModel?, String?> {
  const LocalArticleModelConverter();

  @override
  LocalArticleModel? fromSql(String? fromDb) {
    if (fromDb == null) return null;
    return LocalArticleModel.fromJson(
        Map<String, dynamic>.from(jsonDecode(fromDb)));
  }

  @override
  String? toSql(LocalArticleModel? value) {
    if (value == null) return null;
    return jsonEncode(value.toJson());
  }
}
