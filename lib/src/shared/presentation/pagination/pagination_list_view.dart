import 'package:flutter/material.dart';
import 'loading_more_data_widget.dart';

class PaginationListView extends StatelessWidget {
  const PaginationListView({
    super.key,
    required this.canLoadMoreData,
    required this.itemCount,
    required this.itemBuilder,
    this.separatorBuilder,
    this.errorWidget,
    this.emptyWidget,
    this.loadingWidget,
    this.hasError = false,
    this.padding,
    this.physics,
    this.shrinkWrap = false,
  });

  final int itemCount;
  final bool Function() canLoadMoreData;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final Widget? loadingWidget;
  final bool hasError;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    if (itemCount <= 0) {
      return emptyWidget ?? const SizedBox.shrink();
    }
    return ListView.separated(
      shrinkWrap: shrinkWrap,
      physics: physics,
      separatorBuilder:
          separatorBuilder ?? (context, index) => const SizedBox.shrink(),
      itemCount: itemCount + 1,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 12),
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
