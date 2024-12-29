import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String email;
  final String userName;
  final String? phoneNumber;
  final String? country;
  final String? profileImage;

  UserModel({
    required this.id,
    required this.email,
    required this.userName,
    this.phoneNumber,
    this.country,
    this.profileImage,
  });

  @override
  String toString() {
    return 'UserModel{id: $id, email: $email, userName: $userName, phoneNumber: $phoneNumber, country: $country, profileImage: $profileImage}';
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
