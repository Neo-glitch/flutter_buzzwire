import 'package:buzzwire/src/features/notification/domain/entity/topic_entity.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'topics_following_setup_state.freezed.dart';

@freezed
class TopicsFollowingSetupState with _$TopicsFollowingSetupState {
  const factory TopicsFollowingSetupState({
    @Default(Empty()) LoadState loadState,
    @Default([]) List<TopicEntity> topics,
    @Default([]) List<TopicEntity> selectedTopics,
  }) = _TopicsFollowingSetupState;
}
