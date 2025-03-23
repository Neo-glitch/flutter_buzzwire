import 'package:flutter/material.dart';

/// loading more or error widget for paginatedlist
class LoadingMoreDataWidget extends StatelessWidget {
  const LoadingMoreDataWidget({
    super.key,
    this.hasError = false,
    this.canLoadMoreData = false,
    this.errorWidget,
    this.loadingWidget,
  });
  final bool hasError;
  final bool canLoadMoreData;
  final Widget? errorWidget;
  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
    if (hasError) {
      return errorWidget ?? const SizedBox.shrink();
    }
    if (canLoadMoreData && !hasError) {
      return Center(child: loadingWidget ?? const CircularProgressIndicator());
    }
    return const SizedBox.shrink();
  }
}
