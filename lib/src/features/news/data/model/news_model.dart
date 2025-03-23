import 'package:json_annotation/json_annotation.dart';

import 'article_model.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  final String? status;
  final int? totalResults;
  final List<ArticleModel>? articles;

  const NewsModel({this.status, this.totalResults, this.articles});

  @override
  String toString() {
    return 'NewsResponse(status: $status, totalResults: $totalResults, articles: $articles)';
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return _$NewsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);

  NewsModel copyWith({
    String? status,
    int? totalResults,
    List<ArticleModel>? articles,
  }) {
    return NewsModel(
      status: status ?? this.status,
      totalResults: totalResults ?? this.totalResults,
      articles: articles ?? this.articles,
    );
  }
}
