import 'package:buzzwire/src/features/news/presentation/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class NewsScreen extends ConsumerStatefulWidget {
  final String category;
  const NewsScreen(this.category, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsScreenState();
}

class _NewsScreenState extends ConsumerState<NewsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListView.separated(
        itemBuilder: (ctx, idx) {
          return NewsCard(widget.category);
        },
        separatorBuilder: (ctx, idx) {
          return const Gap(15);
        },
        itemCount: 10,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
