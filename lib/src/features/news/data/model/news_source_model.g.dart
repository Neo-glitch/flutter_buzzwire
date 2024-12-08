// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_source_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsSourceModel _$NewsSourceModelFromJson(Map<String, dynamic> json) =>
    NewsSourceModel(
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => SourceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsSourceModelToJson(NewsSourceModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'sources': instance.sources,
    };
