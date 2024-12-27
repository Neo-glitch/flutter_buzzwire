import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_icon.dart';
import 'package:buzzwire/src/shared/presentation/widgets/keep_alive_page.dart';
import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/news/presentation/categories.dart';
import 'package:buzzwire/src/features/news/presentation/pages/home_news_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: SafeArea(
        child: Scaffold(
          body: ExtendedNestedScrollView(
            onlyOneScrollInBody: true,
            floatHeaderSlivers: true,
            // controller: _scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [_buildAppBar(context, innerBoxIsScrolled)];
            },
            body: _buildTabBarView(),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, bool innerBoxScrolled) {
    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: true,
      forceElevated: innerBoxScrolled,
      flexibleSpace: FlexibleSpaceBar(
        background: BuzzWireAppBar(
          title: const BuzzWireAppIcon(
            alignment: MainAxisAlignment.start,
          ),
          actions: [
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
        ),
      ),
      bottom: _buildTabBar(context),
    );
  }

  TabBar _buildTabBar(BuildContext context) {
    return TabBar(
      labelColor: context.onBackgroundColor,
      labelStyle: context.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
      unselectedLabelStyle:
          context.bodyMedium?.copyWith(fontWeight: FontWeight.normal),
      tabAlignment: TabAlignment.start,
      controller: _tabController,
      isScrollable: true,
      indicatorWeight: 0.1,
      dividerHeight: 0.3,
      dividerColor: BuzzWireColors.darkGrey,
      tabs: _buildTabItems(),
    );
  }

  List<Widget> _buildTabItems() {
    return List.generate(
      categories.length,
      (index) => Tab(
        text: categories[index],
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: categories.map((String name) {
        return _buildNewsPage(name);
      }).toList(),
    );
  }

  Widget _buildNewsPage(String category) {
    NewsCategory newsCategory =
        NewsCategory.values.byName(category.toLowerCase());

    return switch (newsCategory) {
      NewsCategory.business => KeepPageAlive(
          child: HomeNewsPage(category,
              () => _tabController.index == categories.indexOf(category)),
        ),
      NewsCategory.entertainment => KeepPageAlive(
          child: HomeNewsPage(category,
              () => _tabController.index == categories.indexOf(category)),
        ),
      NewsCategory.general => KeepPageAlive(
          child: HomeNewsPage(category,
              () => _tabController.index == categories.indexOf(category)),
        ),
      NewsCategory.health => KeepPageAlive(
          child: HomeNewsPage(category,
              () => _tabController.index == categories.indexOf(category))),
      NewsCategory.science => KeepPageAlive(
          child: HomeNewsPage(category,
              () => _tabController.index == categories.indexOf(category))),
      NewsCategory.sports => KeepPageAlive(
          child: HomeNewsPage(category,
              () => _tabController.index == categories.indexOf(category))),
      NewsCategory.technology => KeepPageAlive(
          child: HomeNewsPage(category,
              () => _tabController.index == categories.indexOf(category))),
    };
  }
}

enum HomeScreenPage {
  business(0),
  entertainment(1),
  general(2),
  health(3),
  science(4),
  sports(5),
  technology(6);

  final int pageIdx;

  const HomeScreenPage(this.pageIdx);
}
