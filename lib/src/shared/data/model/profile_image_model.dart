import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_image_model.g.dart';

@JsonSerializable()
class ProfileImageModel {
  final String fileId;
  final String imageUrl;

  ProfileImageModel({required this.fileId, required this.imageUrl});

  factory ProfileImageModel.fromJson(Map<String, dynamic> json) {
    return _$ProfileImageModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileImageModelToJson(this);

  factory ProfileImageModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
    SnapshotOptions? options,
  ) {
    final data = doc.data()!;
    return ProfileImageModel.fromJson(data);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'fileId': fileId,
      'imageUrl': imageUrl,
    };
  }
}
