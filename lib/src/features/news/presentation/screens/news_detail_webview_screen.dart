import 'package:buzzwire/core/error/error_text.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/news_detail_webview_controller.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/news_detail_webview_state.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_empty_or_error_screen.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailWebViewScreen extends ConsumerStatefulWidget {
  final String articleUrl;
  const NewsDetailWebViewScreen({
    super.key,
    required this.articleUrl,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewsDetailWebViewScreenState();
}

class _NewsDetailWebViewScreenState
    extends ConsumerState<NewsDetailWebViewScreen> {
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
    final uiState = ref.watch(newsDetailWebViewControllerProvider);
    return WillPopScope(
      onWillPop: _canGoBack,
      child: Scaffold(
        appBar: _buildAppBar(uiState),
        body: SafeArea(child: _buildBody(uiState)),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(NewsDetailWebViewState uiState) {
    return const BuzzWireAppBar();
  }

  Widget _buildBody(NewsDetailWebViewState uiState) {
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
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            ref
                .read(newsDetailWebViewControllerProvider.notifier)
                .setLoadState(const Loading());
          },
          onPageFinished: (String url) {
            ref
                .read(newsDetailWebViewControllerProvider.notifier)
                .setLoadState(const Loaded());
          },
          onWebResourceError: (WebResourceError error) {
            ref
                .read(newsDetailWebViewControllerProvider.notifier)
                .setLoadState(const Error(message: ErrorText.unknownError));
          },
          onHttpError: (error) {
            ref
                .read(newsDetailWebViewControllerProvider.notifier)
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
      ..loadRequest(Uri.parse(widget.articleUrl));
  }
}
