import 'package:json_annotation/json_annotation.dart';

part 'source_model.g.dart';

@JsonSerializable()
class SourceModel {
  final String? id;
  final String? name;

  const SourceModel({this.id, this.name});

  @override
  String toString() => 'Source(id: $id, name: $name)';

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return _$SourceModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SourceModelToJson(this);

  SourceModel copyWith({
    String? id,
    String? name,
  }) {
    return SourceModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
