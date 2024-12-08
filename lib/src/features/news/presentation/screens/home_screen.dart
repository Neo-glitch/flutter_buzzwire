import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:buzzwire/core/common/widgets/app_icon.dart';
import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/navigation/route.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/core/utils/logging/logger_helper.dart';
import 'package:buzzwire/src/features/news/presentation/widgets/news_headline_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: ListView(
          controller: _scrollController,
          children: [
            NewsHeadlineItemWidget(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const BuzzWireAppIcon(
        alignment: MainAxisAlignment.start,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: BuzzWireColors.grey, width: 2),
              color: context.surfaceColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 14,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(16),
              child: CachedNetworkImage(
                placeholder: (context, url) {
                  // Todo: replace with reasonable place holder image
                  return const CircularProgressIndicator();
                },
                imageUrl:
                    "https://pixlr.com/images/generator/photo-generator.webp",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
