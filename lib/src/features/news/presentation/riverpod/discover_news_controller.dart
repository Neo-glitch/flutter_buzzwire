import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/core/utils/extensions/list_extension.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/domain/entity/news_entity.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_headlines_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_news_usecase.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/discover_news_state.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_stream_usecase.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_usecase.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'discover_news_controller.g.dart';

@riverpod
class DiscoverNewsController extends _$DiscoverNewsController {
  late GetNewsUseCase _getNews;
  late GetHeadlinesUseCase _getHeadlines;
  late GetCachedUserUseCase _getCachedUserUseCase;
  late GetCachedUserStreamUseCase _getCachedUserStream;
  List<String> _previousTopicsOfInterest = [];

  @override
  DiscoverNewsState build() {
    _getHeadlines = injector();
    _getNews = injector();
    _getCachedUserUseCase = injector();
    _getCachedUserStream = injector();
    final user = _getCachedUserUseCase(NoParams()).getOrElse((l) => null);
    _previousTopicsOfInterest = user?.topicsFollowing.orEmpty ?? [];
    return const DiscoverNewsState();
  }

  void observeUserStream() {
    _getCachedUserStream(NoParams()).listen((userResult) {
      final user = userResult.getOrElse((l) => null);

      if (user != null && _previousTopicsOfInterest != user.topicsFollowing) {
        _previousTopicsOfInterest = user.topicsFollowing;
        fetchItems();
      }
    });
  }

  Future<void> fetchItems({
    bool isRefresh = false,
  }) async {
    state = state.copyWith(loadState: const Loading());

    final headlinesRespose = await _getHeadlines(NoParams());
    final responses = [headlinesRespose];

    final topicsOfInterestNewsResponses = await Future.wait(
      _previousTopicsOfInterest.map(
        (topic) {
          return _getNews(GetNewsParams(topic, 1));
        },
      ),
    );
    if (topicsOfInterestNewsResponses.isNotEmpty) {
      responses.addAll(topicsOfInterestNewsResponses);
    }

    bool isAllFailure = responses.every((response) => response.isLeft());

    if (isAllFailure) {
      // show error view only when all responses return failure
      Either<Failure, NewsEntity> firstFailure =
          responses.firstWhere((response) => response.isLeft());
      final errorMessage = firstFailure.fold((l) => l, (r) => null)!.message;
      state = state.copyWith(loadState: Error(message: errorMessage));
      return;
    }

    _handleResponses(responses, isRefresh: isRefresh);
  }

  void _handleResponses(
    List<Either<Failure, NewsEntity>> responses, {
    bool isRefresh = false,
  }) {
    final headlinesResponse = responses[0];

    _handleHeadlinesResponse(headlinesResponse);
    _handleArticlesResponseForTopicsOfInterest(responses, isRefresh: isRefresh);
  }

  void _handleHeadlinesResponse(Either<Failure, NewsEntity> response) {
    if (response.isRight()) {
      final newsEntity = response.fold((l) => null, (result) => result);
      final articles = newsEntity?.articles;
      state = state.copyWith(
          loadState: const Loaded(), breakingNewsItems: articles.orEmpty);
    }
  }

  void _handleArticlesResponseForTopicsOfInterest(
    List<Either<Failure, NewsEntity>> responses, {
    bool isRefresh = false,
  }) {
    Map<String, List<ArticleEntity>> topicToArticlesMap = {};
    for (int i = 1; i < responses.length; i++) {
      final response = responses[i];
      final topicOfInterest = _previousTopicsOfInterest[i - 1];
      final newsEntity = response.fold((l) => null, (result) => result);
      if (newsEntity != null) {
        topicToArticlesMap[topicOfInterest] = newsEntity.articles.orEmpty;
      } else if (newsEntity == null && isRefresh) {
        // on failure and it's refresh, find previous article fetched from api associated with this topic
        final currentArticlesForTopic =
            state.topicToNewsArticleMap[topicOfInterest];
        if (currentArticlesForTopic != null) {
          topicToArticlesMap[topicOfInterest] = currentArticlesForTopic;
        }
      }
    }
    state = state.copyWith(topicToNewsArticleMap: topicToArticlesMap);
  }
}
