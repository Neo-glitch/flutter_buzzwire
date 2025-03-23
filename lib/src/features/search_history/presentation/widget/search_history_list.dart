import 'package:buzzwire/src/features/search_history/domain/entity/search_history_entity.dart';
import 'package:buzzwire/src/features/search_history/presentation/widget/article_search_history_card.dart';
import 'package:buzzwire/src/features/search_history/presentation/widget/query_search_history_card.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class SearchHistoryList extends StatefulWidget {
  final List<SearchHistoryEntity> searchHistories;
  final void Function(SearchHistoryEntity searchHistory) onItemClick;
  final void Function(SearchHistoryEntity searchHistoryEntity) onItemDelete;
  const SearchHistoryList({
    super.key,
    required this.searchHistories,
    required this.onItemClick,
    required this.onItemDelete,
  });

  @override
  State<SearchHistoryList> createState() => _SearchHistoryListState();
}

class _SearchHistoryListState extends State<SearchHistoryList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (ctx, idx) {
        final searchHistory = widget.searchHistories[idx];
        return _buildItem(searchHistory);
      },
      separatorBuilder: (ctx, idx) {
        return const Gap(20);
      },
      itemCount: widget.searchHistories.length,
    );
  }

  Widget _buildItem(SearchHistoryEntity searchHistory) {
    if (searchHistory.search != null) {
      return QuerySearchHistoryCard(
        searchHistory: searchHistory,
        onDelete: widget.onItemDelete,
        onClick: widget.onItemClick,
      );
    } else if (searchHistory.article != null) {
      return ArticleSearchHistoryCard(
        searchHistory: searchHistory,
        onDelete: widget.onItemDelete,
        onClick: widget.onItemClick,
      );
    }
    throw ArgumentError(
        "Search History is neither an article nor a search string");
  }
}
