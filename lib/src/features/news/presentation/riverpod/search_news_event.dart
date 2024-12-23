import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/search_history/domain/entity/search_history_entity.dart';

sealed class SearchNewsEvent {
  const SearchNewsEvent();
}

class QueryNewsEvent extends SearchNewsEvent {
  final String query;
  const QueryNewsEvent(this.query) : super();
}

class FetchNewsEvent extends SearchNewsEvent {
  final String query;
  final int page;

  const FetchNewsEvent({required this.query, required this.page}) : super();
}

class SaveSearchHistoryEvent extends SearchNewsEvent {
  final String? search;
  final ArticleEntity? article;

  const SaveSearchHistoryEvent({this.search, this.article}) : super();
}

class DeleteSearchHistoryEvent extends SearchNewsEvent {
  final SearchHistoryEntity searchHistory;

  const DeleteSearchHistoryEvent({required this.searchHistory}) : super();
}

class GetSearchHistoryEvent extends SearchNewsEvent {}

class ResetLoadSateEvent extends SearchNewsEvent {}
