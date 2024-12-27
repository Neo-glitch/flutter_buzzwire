import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_news_state.freezed.dart';

@freezed
class HomeNewsState with _$HomeNewsState {
  const factory HomeNewsState({
    @Default(Empty()) LoadState loadState,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default([]) List<ArticleEntity> articles,
    @Default([]) List<ArticleEntity> savedArticles,
  }) = _HomeNewsState;
}
