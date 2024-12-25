import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../shared/presentation/riverpod/load_state.dart';

part 'news_details_state.freezed.dart';

@freezed
class NewsDetailsState with _$NewsDetailsState {
  const factory NewsDetailsState({
    @Default(Empty()) LoadState loadState,
    @Default(false) bool isArticleSaved,
    @Default([]) List<ArticleEntity> savedArticles,
  }) = _NewsDetailsState;
}
