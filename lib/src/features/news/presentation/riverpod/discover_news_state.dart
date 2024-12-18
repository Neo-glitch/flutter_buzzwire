import 'package:buzzwire/core/common/riverpod/load_state.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'discover_news_state.freezed.dart';

@freezed
class DiscoverNewsState with _$DiscoverNewsState {
  const factory DiscoverNewsState({
    @Default(Empty()) LoadState loadState,
    @Default([]) List<ArticleEntity> breakingNewsItems,
    @Default([]) List<ArticleEntity> firstTrendingNewsList,
    @Default([]) List<ArticleEntity> secondTrendingNewsList,
    @Default([]) List<ArticleEntity> thirdTrendingNewsList,
  }) = _DiscoverNewsState;
}
