import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/search_history/domain/entity/search_history_entity.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_news_state.freezed.dart';

@freezed
class SearchNewsState with _$SearchNewsState {
  const factory SearchNewsState({
    @Default(Empty()) LoadState loadState,
    @Default([]) List<SearchHistoryEntity> searchHistories,
    @Default([]) List<ArticleEntity> searchResults,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
  }) = _SearchNewsState;
}
