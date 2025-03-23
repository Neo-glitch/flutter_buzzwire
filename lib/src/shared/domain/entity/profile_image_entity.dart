import 'package:equatable/equatable.dart';

class ProfileImageEntity extends Equatable {
  final String fileId;
  final String imageUrl;

  const ProfileImageEntity({required this.fileId, required this.imageUrl});

  @override
  List<Object?> get props => [fileId, imageUrl];
}
