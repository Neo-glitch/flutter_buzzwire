import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/navigation/route.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/news_detail_controller.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/news_detail_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

class NewsDetailScreen extends ConsumerStatefulWidget {
  final ArticleEntity article;

  const NewsDetailScreen({
    super.key,
    required this.article,
  });

  @override
  ConsumerState<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends ConsumerState<NewsDetailScreen> {
  void _navigateToNewsDetailWebViewScreen() {
    context.pushNamed(BuzzWireRoute.newsDetailWebViewScreen.name,
        extra: widget.article.articleUrl.orEmpty);
  }

  void _shareArticle() async {
    HapticFeedback.mediumImpact();
    await Share.share(widget.article.articleUrl.orEmpty);
  }

  void _saveOrUnSaveArticle() {
    HapticFeedback.mediumImpact();
    ref
        .read(newsDetailControllerProvider(widget.article).notifier)
        .saveOrUnsaveNewsArticle();
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(newsDetailControllerProvider(widget.article).notifier)
          .mapArticle();
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(newsDetailControllerProvider(widget.article));

    return Scaffold(
      appBar: _buildAppBar(uiState),
      body: _buildBody(uiState),
    );
  }

  Widget _buildBody(NewsDetailState uiState) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          _buildTitle(),
          _buildImage(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      child: Text(
        widget.article.title.orEmpty,
        style: context.titleLarge,
      ),
    );
  }

  Widget _buildImage() {
    return BuzzWireImageCard(
      imageUrl: widget.article.image,
      height: 200,
      width: double.infinity,
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Text(
            widget.article.content.orEmpty,
            style: context.bodyMedium,
          ),
          const Gap(10),
          TextButton(
            onPressed: _navigateToNewsDetailWebViewScreen,
            child: Text(
              BuzzWireStrings.readFullArticle,
              style:
                  context.bodyMedium?.copyWith(color: context.secondaryColor),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(NewsDetailState uiState) {
    final icon = uiState.article?.isSaved == true
        ? FontAwesomeIcons.solidBookmark
        : FontAwesomeIcons.bookmark;

    return BuzzWireAppBar(
      actions: [
        IconButton(
          iconSize: 20,
          onPressed: _saveOrUnSaveArticle,
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: FaIcon(
              key: ValueKey(uiState.article?.isSaved == true),
              icon,
            ),
            transitionBuilder: (child, anim) {
              return ScaleTransition(
                scale: anim,
                child: child,
              );
            },
          ),
        ),
        IconButton(
          iconSize: 20,
          onPressed: _shareArticle,
          icon: const FaIcon(FontAwesomeIcons.retweet),
        ),
      ],
    );
  }
}
