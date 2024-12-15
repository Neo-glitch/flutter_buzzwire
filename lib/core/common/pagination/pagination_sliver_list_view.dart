import 'package:flutter/cupertino.dart';

import 'loading_more_data_widget.dart';

class PaginationSliverListView extends StatelessWidget {
  const PaginationSliverListView({
    super.key,
    required this.canLoadMoreData,
    required this.itemCount,
    required this.itemBuilder,
    this.separatorBuilder,
    this.errorWidget,
    this.loadingWidget,
    this.hasError = false,
  });

  final int itemCount;
  final bool Function() canLoadMoreData;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final Widget? errorWidget;
  final Widget? loadingWidget;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder:
          separatorBuilder ?? (context, index) => const SizedBox.shrink(),
      itemCount: itemCount + 1,
      itemBuilder: (context, index) {
        if (index == itemCount) {
          return LoadingMoreDataWidget(
            canLoadMoreData: canLoadMoreData(),
            hasError: hasError,
            errorWidget: errorWidget,
            loadingWidget: loadingWidget,
          );
        }
        return itemBuilder(context, index);
      },
    );
  }
}
