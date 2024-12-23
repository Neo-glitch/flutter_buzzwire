import 'dart:convert';

import 'package:buzzwire/src/features/news/data/model/article_model.dart';
import 'package:buzzwire/src/features/news/data/model/local_article_model.dart';
import 'package:floor/floor.dart';

class LocalArticleModelConverter
    extends TypeConverter<LocalArticleModel?, String?> {
  @override
  LocalArticleModel? decode(String? databaseValue) {
    if (databaseValue == null) return null;
    final articleModelJson =
        Map<String, dynamic>.from(jsonDecode(databaseValue));
    return LocalArticleModel.fromJson(articleModelJson);
  }

  @override
  String? encode(LocalArticleModel? value) {
    if (value == null) return null;
    return jsonEncode(value.toJson());
  }
}
