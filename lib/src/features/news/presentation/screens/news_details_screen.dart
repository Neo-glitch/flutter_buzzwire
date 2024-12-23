import 'package:buzzwire/src/features/news/domain/entity/article_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsDetailsScreen extends ConsumerWidget {
  final ArticleEntity article;
  const NewsDetailsScreen({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Text("Details screen"),
    );
  }
}
