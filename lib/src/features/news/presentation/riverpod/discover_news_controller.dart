import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/core/utils/extensions/list_extension.dart';
import 'package:buzzwire/src/features/news/domain/entity/news_entity.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_headlines_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_news_usecase.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/discover_news_state.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'discover_news_controller.g.dart';

@riverpod
class DiscoverNewsController extends _$DiscoverNewsController {
  late GetNews _getNews;
  late GetHeadlines _getHeadlines;
  final _trendingNewsTopics = ["Politics", "Music", "Finance"];

  @override
  DiscoverNewsState build() {
    _getHeadlines = injector();
    _getNews = injector();
    return const DiscoverNewsState();
  }

  void fetchItems() async {
    state = state.copyWith(loadState: const Loading());

    List<Either<Failure, NewsEntity>> responses = await Future.wait([
      _getHeadlines(NoParams()),
      _getNews(GetNewsParams(_trendingNewsTopics[0], 1)),
      _getNews(GetNewsParams(_trendingNewsTopics[1], 1)),
      _getNews(GetNewsParams(_trendingNewsTopics[2], 1)),
    ]);

    bool isAllFailure = responses.every((response) => response.isLeft());

    if (isAllFailure) {
      // show erro view only when all responses return failure
      Either<Failure, NewsEntity> firstFailure =
          responses.firstWhere((response) => response.isLeft());
      final errorMessage = firstFailure.fold((l) => l, (r) => null)!.message;
      state = state.copyWith(loadState: Error(message: errorMessage));
      return;
    }

    _handleResponses(responses);
  }

  void _handleResponses(List<Either<Failure, NewsEntity>> responses) {
    final headlinesResponse = responses[0];
    final firstTrendingNewsResponse = responses[1];
    final secondTrendingNewsResponse = responses[2];
    final thirdTrendingNewsResponse = responses[3];

    _handleHeadlinesResponse(headlinesResponse);
    _handleFirstTrendingNewsResponse(firstTrendingNewsResponse);
    _handleSecondTrendingNewsResponse(secondTrendingNewsResponse);
    _handleThirdTrendingNewsResponse(thirdTrendingNewsResponse);
  }

  void _handleHeadlinesResponse(Either<Failure, NewsEntity> response) {
    if (response.isRight()) {
      final newsEntity = response.fold((l) => null, (result) => result);
      final articles = newsEntity?.articles;
      state = state.copyWith(
          loadState: const Loaded(), breakingNewsItems: articles.orEmpty);
    }
  }

  void _handleFirstTrendingNewsResponse(Either<Failure, NewsEntity> response) {
    if (response.isRight()) {
      final newsEntity = response.fold((l) => null, (result) => result);
      final articles = newsEntity?.articles;
      state = state.copyWith(
          loadState: const Loaded(), firstTrendingNewsList: articles.orEmpty);
    }
  }

  void _handleSecondTrendingNewsResponse(Either<Failure, NewsEntity> response) {
    if (response.isRight()) {
      final newsEntity = response.fold((l) => null, (result) => result);
      final articles = newsEntity?.articles;
      state = state.copyWith(
          loadState: const Loaded(), secondTrendingNewsList: articles.orEmpty);
    }
  }

  void _handleThirdTrendingNewsResponse(Either<Failure, NewsEntity> response) {
    if (response.isRight()) {
      final newsEntity = response.fold((l) => null, (result) => result);
      final articles = newsEntity?.articles;
      state = state.copyWith(
          loadState: const Loaded(), thirdTrendingNewsList: articles.orEmpty);
    }
  }

  List<String> get trendingNewsTopics {
    return _trendingNewsTopics;
  }
}
