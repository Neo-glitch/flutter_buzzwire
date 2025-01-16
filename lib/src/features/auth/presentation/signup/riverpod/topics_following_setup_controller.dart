import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/auth/presentation/signup/riverpod/topics_following_setup_state.dart';
import 'package:buzzwire/src/features/notification/domain/entity/topic_entity.dart';
import 'package:buzzwire/src/features/notification/domain/usecases/get_topics_usecase.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'topics_following_setup_controller.g.dart';

@riverpod
class TopicsFollowingSetupController extends _$TopicsFollowingSetupController {
  late GetTopicsUsecase _getTopicsUsecase;

  @override
  TopicsFollowingSetupState build() {
    _getTopicsUsecase = injector();
    return const TopicsFollowingSetupState();
  }

  void getTopics() async {
    state = state.copyWith(loadState: const Loading());
    final result = await _getTopicsUsecase(NoParams());
    result.fold(
      (failure) {
        state = state.copyWith(loadState: Error(message: failure.message));
      },
      (topics) {
        state = state.copyWith(loadState: const Loaded(), topics: topics);
      },
    );
  }

  void toggleTopicSelection(TopicEntity topic) {
    final selectedTopics = state.selectedTopics.toList();

    if (selectedTopics.contains(topic)) {
      selectedTopics.remove(topic);
    } else {
      selectedTopics.add(topic);
    }

    state = state.copyWith(selectedTopics: selectedTopics);
  }
}
