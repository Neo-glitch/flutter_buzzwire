import 'package:buzzwire/core/database/model/local_article_model.dart';

class SearchHistoryModel {
  final int? id;
  final String? search;
  final LocalArticleModel? article;
  final DateTime createdAt;

  SearchHistoryModel({
    this.id,
    required this.createdAt,
    this.search,
    this.article,
  });
}
