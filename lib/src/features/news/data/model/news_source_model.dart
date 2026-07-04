import 'package:json_annotation/json_annotation.dart';

import 'source_model.dart';

part 'news_source_model.g.dart';

@JsonSerializable()
class NewsSourceModel {
  final String? status;
  final List<SourceModel>? sources;

  NewsSourceModel({this.status, this.sources});

  @override
  String toString() {
    return 'NewsSourceResponse(status: $status, sources: $sources)';
  }

  factory NewsSourceModel.fromJson(Map<String, dynamic> json) {
    return _$NewsSourceModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewsSourceModelToJson(this);

  NewsSourceModel copyWith({
    String? status,
    List<SourceModel>? sources,
  }) {
    return NewsSourceModel(
      status: status ?? this.status,
      sources: sources ?? this.sources,
    );
  }
}
