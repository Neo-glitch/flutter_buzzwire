import 'package:flutter/material.dart';

class ScrollNotificationHandler extends StatelessWidget {
  final bool Function() canLoadMoreData;
  final Function() loadMore;
  final Widget child;

  const ScrollNotificationHandler({
    super.key,
    required this.child,
    required this.loadMore,
    required this.canLoadMoreData,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo is ScrollEndNotification &&
            scrollInfo.metrics.axisDirection == AxisDirection.down &&
            scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent) {
          if (canLoadMoreData()) {
            loadMore();
          }
        }

        return true;
      },
      child: child,
    );
  }
}
