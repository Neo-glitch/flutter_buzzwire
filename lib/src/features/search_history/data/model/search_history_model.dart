import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/src/features/news/data/model/local_article_model.dart';
import 'package:floor/floor.dart';

@Entity(tableName: BuzzWireStrings.searchHistoryTableName)
class SearchHistoryModel {
  @PrimaryKey(autoGenerate: true)
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
