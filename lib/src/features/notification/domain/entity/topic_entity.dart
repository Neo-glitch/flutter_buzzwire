import 'package:equatable/equatable.dart';

class TopicEntity extends Equatable {
  final String title;
  final String imageUrl;

  const TopicEntity({
    required this.title,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [title, imageUrl];
}
