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

class NewsDetailScreen extends ConsumerWidget {
  final ArticleEntity article;

  const NewsDetailScreen({
    super.key,
    required this.article,
  });

  void _navigateToNewsDetailWebViewScreen(BuildContext context) {
    context.pushNamed(BuzzWireRoute.newsDetailWebView.name,
        extra: article.articleUrl.orEmpty);
  }

  void _shareArticle() async {
    await Share.share(article.articleUrl.orEmpty);
  }

  void _saveOrUnSaveArticle(WidgetRef ref) {
    ref
        .read(newsDetailControllerProvider(article).notifier)
        .saveOrUnsaveNewsArticle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(newsDetailControllerProvider(article));

    return Scaffold(
      appBar: _buildAppBar(uiState, ref),
      body: _buildBody(context, uiState),
    );
  }

  Widget _buildBody(BuildContext context, NewsDetailState uiState) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          _buildTitle(context),
          _buildImage(),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      child: Text(
        article.title.orEmpty,
        style: context.titleLarge,
      ),
    );
  }

  Widget _buildImage() {
    return BuzzWireImageCard(
      imageUrl: article.image,
      height: 200,
      width: double.infinity,
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Text(
            article.content.orEmpty,
            style: context.bodyMedium,
          ),
          const Gap(10),
          TextButton(
            onPressed: () => _navigateToNewsDetailWebViewScreen(context),
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

  PreferredSizeWidget _buildAppBar(NewsDetailState uiState, WidgetRef ref) {
    final icon = uiState.article?.isSaved == true
        ? FontAwesomeIcons.solidBookmark
        : FontAwesomeIcons.bookmark;

    return BuzzWireAppBar(
      actions: [
        IconButton(
          iconSize: 20,
          onPressed: () {
            HapticFeedback.mediumImpact();
            _saveOrUnSaveArticle(ref);
          },
          icon: FaIcon(icon),
        ),
        IconButton(
          iconSize: 20,
          onPressed: () {
            HapticFeedback.mediumImpact();
            _shareArticle();
          },
          icon: const FaIcon(FontAwesomeIcons.retweet),
        ),
      ],
    );
  }
}
