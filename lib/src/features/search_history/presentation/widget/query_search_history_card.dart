import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/src/features/search_history/domain/entity/search_history_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class QuerySearchHistoryCard extends StatelessWidget {
  final SearchHistoryEntity searchHistory;
  final void Function(SearchHistoryEntity searchHistory) onDelete;
  final void Function(SearchHistoryEntity searchHistory) onClick;

  const QuerySearchHistoryCard({
    super.key,
    required this.searchHistory,
    required this.onDelete,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(searchHistory),
      child: Row(
        children: [
          const FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            size: 12,
          ),
          const Gap(20),
          Expanded(
            child: Text(
              searchHistory.search.orEmpty,
              maxLines: 1,
              style: context.bodyMedium?.copyWith(fontSize: 12),
            ),
          ),
          InkWell(
            onTap: () => onDelete(searchHistory),
            child: const FaIcon(
              FontAwesomeIcons.xmark,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
