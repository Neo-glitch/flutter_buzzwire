import 'package:buzzwire/core/navigation/route.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/saved_news_controller.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/saved_news_state.dart';
import 'package:buzzwire/src/features/news/presentation/widgets/news_card.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_empty_or_error_screen.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SavedNewsScreen extends ConsumerStatefulWidget {
  const SavedNewsScreen({super.key});

  @override
  SavedNewsScreenState createState() => SavedNewsScreenState();
}

class SavedNewsScreenState extends ConsumerState<SavedNewsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(savedNewsControllerProvider.notifier).fetchSavedArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(savedNewsControllerProvider);
    return Scaffold(
      appBar: BuzzWireAppBar(
        title: Text(
          "Saved Articles",
          style: context.titleLarge?.copyWith(fontSize: 20),
        ),
      ),
      body: _buildBody(uiState),
    );
  }

  Widget _buildBody(SavedNewsState uiState) {
    if (uiState.loadState is Loading) {
      return const BuzzWireProgressLoader();
    }

    return _buildContent(uiState.savedArticles);
  }

  Widget _buildContent(List<ArticleEntity> savedArticles) {
    if (savedArticles.isEmpty) {
      return BuzzWireEmptyOrErrorScreen.empty(
        message:
            "It seems your saved articles list is empty. Explore our collection and save your favorites!",
      );
    } else {
      return _buildSavedArticleList(savedArticles);
    }
  }

  Widget _buildSavedArticleList(List<ArticleEntity> savedArticles) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemBuilder: (ctx, idx) => _buildItem(savedArticles[idx]),
      separatorBuilder: (ctx, idx) => const Gap(15),
      itemCount: savedArticles.length,
    );
  }

  Widget _buildItem(ArticleEntity article) {
    return NewsCard(
      article: article,
      onClick: (article) {
        context.pushNamed(
          BuzzWireRoute.newsDetails.name,
          extra: article,
        );
      },
      onSave: (article) async {
        ref
            .read(savedNewsControllerProvider.notifier)
            .deleteSavedArticle(article);
        context.showSnackBar("Article unbookmarked");
        return true;
      },
    );
  }
}
