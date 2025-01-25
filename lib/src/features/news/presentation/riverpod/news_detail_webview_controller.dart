import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/news_detail_webview_state.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_detail_webview_controller.g.dart';

@riverpod
class NewsDetailWebViewController extends _$NewsDetailWebViewController {
  @override
  NewsDetailWebViewState build() {
    print("\nNews Detail controller Build called\n");
    return const NewsDetailWebViewState();
  }

  void setLoadState(LoadState loadState) {
    state = state.copyWith(loadState: loadState);
  }
}
