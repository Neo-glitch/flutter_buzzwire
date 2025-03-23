import 'package:buzzwire/src/shared/domain/entity/country_entity.dart';
import 'package:buzzwire/src/shared/domain/entity/profile_image_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserEntity extends Equatable {
  final String userId;
  final String email;
  List<String> topicsFollowing;
  String userName;
  String? phoneNumber;
  CountryEntity country;
  ProfileImageEntity? profileImage;

  UserEntity({
    required this.userId,
    required this.email,
    required this.userName,
    required this.country,
    required this.topicsFollowing,
    this.phoneNumber,
    this.profileImage,
  });

  @override
  List<Object?> get props => [
        userId,
        email,
        userName,
        phoneNumber,
        country,
        topicsFollowing,
        profileImage,
      ];
}
