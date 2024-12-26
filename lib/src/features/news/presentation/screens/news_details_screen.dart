import 'package:buzzwire/core/error/error_text.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/news_details_controller.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/news_details_state.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_empty_or_error_screen.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsScreen extends ConsumerStatefulWidget {
  final ArticleEntity article;
  const NewsDetailsScreen({
    super.key,
    required this.article,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends ConsumerState<NewsDetailsScreen> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController();
    Future.microtask(() {
      _init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(newsDetailsControllerProvider);
    return SafeArea(
      child: WillPopScope(
        onWillPop: _canGoBack,
        child: Scaffold(
          appBar: _buildAppBar(uiState),
          body: _buildBody(uiState),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(NewsDetailsState uiState) {
    final icon = uiState.isArticleSaved
        ? FontAwesomeIcons.solidBookmark
        : FontAwesomeIcons.bookmark;
    return BuzzWireAppBar(
      actions: [
        IconButton(
          iconSize: 24,
          onPressed: () async {
            HapticFeedback.mediumImpact();
            ref
                .read(newsDetailsControllerProvider.notifier)
                .saveOrDeleteNewsArticle(widget.article);
            await HapticFeedback.mediumImpact();
          },
          icon: FaIcon(icon),
        )
      ],
    );
  }

  Widget _buildBody(NewsDetailsState uiState) {
    if (uiState.loadState is Loading) {
      return const BuzzWireProgressLoader();
    }

    if (uiState.loadState is Error) {
      final message = (uiState.loadState as Error).message;
      return BuzzWireEmptyOrErrorScreen.error(
        message: message,
        onPressed: () {
          _webViewController.reload();
        },
      );
    }

    return WebViewWidget(
      controller: _webViewController,
    );
  }

  Future<bool> _canGoBack() async {
    final doesWebViewHaveMorePages = await _webViewController.canGoBack();
    if (doesWebViewHaveMorePages) {
      _webViewController.goBack();
    }
    return !doesWebViewHaveMorePages;
  }

  void _init() {
    _webViewController
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..setBackgroundColor(context.backgroundColor)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            ref
                .read(newsDetailsControllerProvider.notifier)
                .setLoadState(const Loading());
          },
          onPageFinished: (String url) {
            ref
                .read(newsDetailsControllerProvider.notifier)
                .setLoadState(const Loaded());
          },
          onWebResourceError: (WebResourceError error) {
            ref
                .read(newsDetailsControllerProvider.notifier)
                .setLoadState(const Error(message: ErrorText.unknownError));
          },
          onHttpError: (error) {
            ref
                .read(newsDetailsControllerProvider.notifier)
                .setLoadState(const Error(message: ErrorText.unknownError));
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.article.articleUrl!));
    ref.read(newsDetailsControllerProvider.notifier).init(widget.article);
  }
}
