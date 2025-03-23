import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel {
  final String name;
  final String code;

  CountryModel({
    required this.name,
    required this.code,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return _$CountryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);

  /// Factory constructor for Firestore document deserialization
  factory CountryModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
    SnapshotOptions? options,
  ) {
    final data = doc.data()!;
    return CountryModel.fromJson(data);
  }

  /// Converts the model to a Firestore document map
  Map<String, dynamic> toFirestore() => toJson();
}
