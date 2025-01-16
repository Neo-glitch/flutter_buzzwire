import 'package:buzzwire/src/shared/domain/entity/country_entity.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userId;
  final String email;
  final List<String> topicsFollowing;
  String userName;
  String? phoneNumber;
  CountryEntity country;
  String? profileImage;

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
