import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/notification/domain/entity/topic_entity.dart';
import 'package:buzzwire/src/features/notification/domain/usecases/get_topics_usecase.dart';
import 'package:buzzwire/src/features/notification/domain/usecases/subscribe_to_topic_usecase.dart';
import 'package:buzzwire/src/features/notification/domain/usecases/unsubscribe_from_topic_usecase.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_usecase.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/update_user_usecase.dart';
import 'package:buzzwire/src/features/settings/presentation/riverpod/preferred_topics_state.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preferred_topics_controller.g.dart';

@riverpod
class PreferredTopicsController extends _$PreferredTopicsController {
  late GetCachedUserUseCase _getCachedUserUseCase;
  late GetTopicsUsecase _getTopicsUsecase;
  late UpdateUserUseCase _updateUserUseCase;
  late SubscribeToTopicUsecase _subscribeToTopicUsecase;
  late UnsubscribeFromTopicUsecase _unsubscribeFromTopicUsecase;

  @override
  PreferredTopicsState build() {
    _getTopicsUsecase = injector();
    _getCachedUserUseCase = injector();
    _updateUserUseCase = injector();
    _subscribeToTopicUsecase = injector();
    _unsubscribeFromTopicUsecase = injector();
    return const PreferredTopicsState();
  }

  void getTopics() async {
    state = state.copyWith(loadState: const Loading());
    final result = await _getTopicsUsecase(NoParams());
    result.fold(
      (failure) {
        state = state.copyWith(loadState: Error(message: failure.message));
      },
      (topics) {
        List<TopicEntity> selectedTopics = [];
        final user = _getCachedUserUseCase(NoParams()).getOrElse((l) => null);

        if (user != null) {
          final topicsFollowing = user.topicsFollowing;
          selectedTopics = topics
              .where(
                (topic) => topicsFollowing.contains(topic.title),
              )
              .toList();
        }
        state = state.copyWith(
          loadState: const Loaded(),
          topics: topics,
          selectedTopics: selectedTopics,
        );
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

  void updateTopicsFollowing() async {
    state = state.copyWith(loadState: const Loading());
    final isUnSubscriptionToTopicsSuccess = await _unSubscribeFromAllTopics();
    if (!isUnSubscriptionToTopicsSuccess) return;
    final isSubscriptionToTopicsSuccess = await _subscribeToSelectedTopics();
    if (!isSubscriptionToTopicsSuccess) return;

    _updateUserDetails();
  }

  Future<bool> _unSubscribeFromAllTopics() async {
    final user = _getCachedUserUseCase(NoParams()).getOrElse((l) => null);
    if (user != null) {
      for (String topic in user.topicsFollowing) {
        final response = await _unsubscribeFromTopicUsecase(topic);
        if (response.isLeft()) {
          final result = response.getLeft();
          final failure = result.toNullable();
          state = state.copyWith(loadState: Error(message: failure!.message));
          return false;
        }
      }
      return true;
    }
    return false;
  }

  Future<bool> _subscribeToSelectedTopics() async {
    for (TopicEntity topic in state.selectedTopics) {
      final response = await _subscribeToTopicUsecase(topic.title);
      if (response.isLeft()) {
        final result = response.getLeft();
        final failure = result.toNullable();
        state = state.copyWith(loadState: Error(message: failure!.message));
        return false;
      }
    }
    return true;
  }

  void _updateUserDetails() async {
    final user = _getCachedUserUseCase(NoParams()).getOrElse((l) => null);
    if (user != null) {
      user.topicsFollowing =
          state.selectedTopics.map((topic) => topic.title).toList();
      final response = await _updateUserUseCase(user);
      response.fold(
        (failure) {
          state = state.copyWith(loadState: Error(message: failure.message));
        },
        (_) {
          state = state.copyWith(
            loadState: const Loaded(),
            isUpdateCompleted: true,
          );
        },
      );
    }
  }
}
