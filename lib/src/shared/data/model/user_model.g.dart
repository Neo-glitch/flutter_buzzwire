// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['userId'] as String,
      email: json['email'] as String,
      userName: json['userName'] as String,
      country: CountryModel.fromJson(json['country'] as Map<String, dynamic>),
      topicsFollowing: (json['topicsFollowing'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      phoneNumber: json['phoneNumber'] as String?,
      profileImage: json['profileImage'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'userName': instance.userName,
      'phoneNumber': instance.phoneNumber,
      'country': instance.country,
      'profileImage': instance.profileImage,
      'topicsFollowing': instance.topicsFollowing,
    };
