import 'package:buzzwire/core/common/riverpod/load_state.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_news_state.freezed.dart';

@freezed
class CategoryNewsState with _$CategoryNewsState {
  const factory CategoryNewsState({
    @Default(Empty()) LoadState loadState,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default([]) List<ArticleEntity> articles,
  }) = _CategoryNewsState;
}
