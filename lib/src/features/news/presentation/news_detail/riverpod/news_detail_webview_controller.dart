import 'package:buzzwire/src/features/news/presentation/news_detail/riverpod/news_detail_webview_state.dart';
import 'package:buzzwire/core/ui/model/load_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_detail_webview_controller.g.dart';

@riverpod
class NewsDetailWebViewController extends _$NewsDetailWebViewController {
  @override
  NewsDetailWebViewState build() {
    return const NewsDetailWebViewState();
  }

  void setLoadState(LoadState loadState) {
    state = state.copyWith(loadState: loadState);
  }
}
