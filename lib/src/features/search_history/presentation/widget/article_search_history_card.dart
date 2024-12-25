import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/core/utils/helpers/date_helper_functions.dart';
import 'package:buzzwire/src/features/search_history/domain/entity/search_history_entity.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_image_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class ArticleSearchHistoryCard extends StatelessWidget {
  final SearchHistoryEntity searchHistory;
  final void Function(SearchHistoryEntity searchHistory) onDelete;
  final void Function(SearchHistoryEntity searchHistory) onClick;

  const ArticleSearchHistoryCard({
    super.key,
    required this.searchHistory,
    required this.onDelete,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final title = searchHistory.article?.title;
    final publishedAt = searchHistory.article?.publishedAt;
    final imageUrl = searchHistory.article?.image;
    return GestureDetector(
      onTap: () => onClick(searchHistory),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.orEmpty,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.bodyMedium?.copyWith(fontSize: 12),
                ),
                const Gap(20),
                Text(
                  BuzzWireDateHelperFunctions.formatTimeAgo(
                      publishedAt.orEmpty),
                  style: context.bodySmall?.copyWith(fontSize: 10),
                )
              ],
            ),
          ),
          const Gap(20),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: BuzzWireImageCard(
                    radius: 4,
                    height: 50,
                    imageUrl: imageUrl.orEmpty,
                  ),
                ),
                const Gap(10),
                InkWell(
                  onTap: () => onDelete(searchHistory),
                  child: const FaIcon(
                    FontAwesomeIcons.xmark,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
