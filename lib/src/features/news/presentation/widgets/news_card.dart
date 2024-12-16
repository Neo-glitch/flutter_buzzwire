import 'package:buzzwire/core/utils/extensions/string_extension.dart';
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
  bool isSaved = false;

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
                      isSaved = !isSaved;
                    });
                  },
                  icon: FaIcon(
                    isSaved
                        ? FontAwesomeIcons.solidBookmark
                        : FontAwesomeIcons.bookmark,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              article.publishedAt.orEmpty,
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          placeholder: (context, url) {
            return const Icon(
              Icons.image,
              size: 80,
            );
          },
          errorWidget: (context, url, error) {
            return const Icon(
              Icons.broken_image,
              size: 80,
            );
          },
          height: 120,
          fit: BoxFit.cover,
          imageUrl: article.image.orEmpty,
        ),
      ),
    );
  }
}
