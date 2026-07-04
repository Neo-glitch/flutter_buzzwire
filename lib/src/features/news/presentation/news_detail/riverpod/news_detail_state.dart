import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_detail_state.freezed.dart';

@freezed
class NewsDetailState with _$NewsDetailState {
  const factory NewsDetailState({
    ArticleEntity? article,
  }) = _NewsDetailState;
}
