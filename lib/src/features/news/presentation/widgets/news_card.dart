import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/core/utils/helpers/date_helper_functions.dart';
import 'package:buzzwire/core/utils/helpers/helper_functions.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewsCard extends StatefulWidget {
  final ArticleEntity article;
  final Future<bool> Function(ArticleEntity article)? onSave;
  final void Function(ArticleEntity articleEntity)? onClick;
  const NewsCard({super.key, required this.article, this.onSave, this.onClick});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  void _onSaveClick() async {
    HapticFeedback.mediumImpact();
    setState(() {
      widget.article.isSaved = !widget.article.isSaved;
    });

    if (widget.onSave != null) {
      final isSuccess = await widget.onSave!(widget.article);
      if (!isSuccess) {
        setState(() {
          widget.article.isSaved = !widget.article.isSaved;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onClick != null) {
          widget.onClick!(widget.article);
        }
        BuzzWireHelperFunctions.hideKeyboard();
      },
      child: SizedBox(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageSection(),
            _buildNewsContentSection(),
          ],
        ),
      ),
    );
  }

  Expanded _buildNewsContentSection() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.article.source?.name.orEmpty ?? "",
              overflow: TextOverflow.ellipsis,
              style: context.bodySmall?.copyWith(fontSize: 10),
              maxLines: 1,
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                _buildTitle(),
                _buildSaveButton(),
              ],
            ),
            const Spacer(),
            Text(
              BuzzWireDateHelperFunctions.formatTimeAgo(
                widget.article.publishedAt.orEmpty,
              ),
              maxLines: 1,
              style: context.bodySmall?.copyWith(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return IconButton(
      iconSize: 16,
      onPressed: _onSaveClick,
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: FaIcon(
          // key is what triggers the animation on it's change
          key: ValueKey(widget.article.isSaved),
          widget.article.isSaved
              ? FontAwesomeIcons.solidBookmark
              : FontAwesomeIcons.bookmark,
        ),
        transitionBuilder: (child, anim) {
          return ScaleTransition(
            scale: anim,
            child: child,
          );
        },
      ),
    );
  }

  Widget _buildTitle() {
    return Expanded(
      child: Text(
        widget.article.title.orEmpty,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: context.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildImageSection() {
    return Expanded(
      child: BuzzWireImageCard(
        imageUrl: widget.article.image.orEmpty,
        radius: 10,
        height: 120,
        placeHoldersSize: 80,
      ),
    );
  }
}
