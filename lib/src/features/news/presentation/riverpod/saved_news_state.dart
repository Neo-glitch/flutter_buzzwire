import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_news_state.freezed.dart';

@freezed
class SavedNewsState with _$SavedNewsState {
  const factory SavedNewsState({
    @Default(Empty()) LoadState loadState,
    @Default([]) List<ArticleEntity> savedArticles,
  }) = _SavedNewsState;
}
