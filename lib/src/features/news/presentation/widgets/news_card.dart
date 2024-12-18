import 'package:buzzwire/core/common/widgets/buzzwire_image_card.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/core/utils/helpers/date_helper_functions.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewsCard extends StatefulWidget {
  final String news;
  final ArticleEntity article;
  final void Function(ArticleEntity article)? onSave;
  final void Function(ArticleEntity articleEntity)? onClick;
  const NewsCard(this.news,
      {super.key, required this.article, this.onSave, this.onClick});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageSection(widget.article),
          _buildNewsContentSection(context, widget.article),
        ],
      ),
    );
  }

  Expanded _buildNewsContentSection(
    BuildContext context,
    ArticleEntity article,
  ) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.source?.name.orEmpty ?? "",
              overflow: TextOverflow.ellipsis,
              style:
                  Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
              maxLines: 1,
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Expanded(
                  child: Text(
                    article.title.orEmpty,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                IconButton(
                  iconSize: 16,
                  onPressed: () {
                    setState(() {
                      article.isSaved = !article.isSaved;
                    });
                  },
                  icon: FaIcon(
                    article.isSaved
                        ? FontAwesomeIcons.solidBookmark
                        : FontAwesomeIcons.bookmark,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              BuzzWireDateHelperFunctions.formatTimeAgo(
                article.publishedAt.orEmpty,
              ),
              maxLines: 1,
              style:
                  Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildImageSection(ArticleEntity article) {
    return Expanded(
      child: BuzzWireImageCard(
        imageUrl: article.image.orEmpty,
        radius: 10,
        height: 120,
        placeHoldersSize: 80,
      ),
    );
  }
}
