import 'package:buzzwire/src/features/news/presentation/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SportsNewsPage extends ConsumerStatefulWidget {
  final String _category;
  final TabController tabController;
  const SportsNewsPage(this._category, this.tabController, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SportsNewsPageState();
}

class _SportsNewsPageState extends ConsumerState<SportsNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListView.separated(
        itemBuilder: (ctx, idx) {
          return NewsCard(widget._category);
        },
        separatorBuilder: (ctx, idx) {
          return const Gap(15);
        },
        itemCount: 10,
      ),
    );
  }
}
