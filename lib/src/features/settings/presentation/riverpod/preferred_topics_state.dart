import 'package:buzzwire/src/features/notification/domain/entity/topic_entity.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferred_topics_state.freezed.dart';

@freezed
class PreferredTopicsState with _$PreferredTopicsState {
  const factory PreferredTopicsState({
    @Default(Empty()) LoadState loadState,
    @Default([]) List<TopicEntity> topics,
    @Default([]) List<TopicEntity> selectedTopics,
    @Default(false) bool isUpdateCompleted,
  }) = _PreferredTopicsState;
}
