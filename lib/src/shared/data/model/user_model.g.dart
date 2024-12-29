// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['phoneNumber'] as String?,
      json['country'] as String?,
      id: json['id'] as String,
      email: json['email'] as String,
      userName: json['userName'] as String,
      profileImage: json['profileImage'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'userName': instance.userName,
      'profileImage': instance.profileImage,
      'phoneNumber': instance.phoneNumber,
      'country': instance.country,
    };
