import 'package:buzzwire/src/shared/data/model/country_model.dart';
import 'package:buzzwire/src/shared/data/model/profile_image_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String userId;
  final String email;
  final String userName;
  final String? phoneNumber;
  final CountryModel country;
  final ProfileImageModel? profileImage;
  final List<String> topicsFollowing;

  UserModel({
    required this.userId,
    required this.email,
    required this.userName,
    required this.country,
    required this.topicsFollowing,
    this.phoneNumber,
    this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  /// Factory constructor for Firestore document deserialization
  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
    SnapshotOptions? options,
  ) {
    final data = doc.data()!;
    return UserModel.fromJson(data);
  }

  /// Converts the model to a Firestore document map
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'email': email,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'topicsFollowing': topicsFollowing,
      'country': country.toJson(), // Convert CountryModel to Map
      'profileImage': profileImage?.toJson(),
    };
  }
}
