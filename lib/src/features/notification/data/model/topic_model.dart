import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'topic_model.g.dart';

@JsonSerializable()
class TopicModel {
  final String title;
  final String imageUrl;

  TopicModel({
    required this.title,
    required this.imageUrl,
  });

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return _$TopicModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TopicModelToJson(this);

  /// Factory constructor for Firestore document deserialization
  factory TopicModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
    SnapshotOptions? options,
  ) {
    final data = doc.data()!;
    return TopicModel.fromJson(data);
  }

  /// Converts the model to a Firestore document map
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'imageUrl': imageUrl,
    };
  }
}
