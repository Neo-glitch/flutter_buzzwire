import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/presentation/riverpod/load_state.dart';

part 'news_detail_webview_state.freezed.dart';

@freezed
class NewsDetailWebViewState with _$NewsDetailWebViewState {
  const factory NewsDetailWebViewState({
    @Default(Empty()) LoadState loadState,
  }) = _NewsDetailWebViewState;
}
