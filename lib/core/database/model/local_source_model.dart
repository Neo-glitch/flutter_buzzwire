import 'package:json_annotation/json_annotation.dart';

part 'local_source_model.g.dart';

@JsonSerializable()
class LocalSourceModel {
  final String? id;
  final String? name;

  const LocalSourceModel({this.id, this.name});

  @override
  String toString() => 'LocalSource(id: $id, name: $name)';

  factory LocalSourceModel.fromJson(Map<String, dynamic> json) {
    return _$LocalSourceModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocalSourceModelToJson(this);

  LocalSourceModel copyWith({
    String? id,
    String? name,
  }) {
    return LocalSourceModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
