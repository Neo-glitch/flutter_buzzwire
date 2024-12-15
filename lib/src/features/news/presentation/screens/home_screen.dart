import 'package:buzzwire/core/common/widgets/buzzwire_empty_or_error_screen.dart';
import 'package:buzzwire/core/common/widgets/keep_alive_page.dart';
import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/news/presentation/categories.dart';
import 'package:buzzwire/src/features/news/presentation/pages/business_news_page.dart';
import 'package:buzzwire/src/features/news/presentation/pages/entertainment_news_page.dart';
import 'package:buzzwire/src/features/news/presentation/pages/general_news_page.dart';
import 'package:buzzwire/src/features/news/presentation/pages/health_news_page.dart';
import 'package:buzzwire/src/features/news/presentation/pages/science_news_page.dart';
import 'package:buzzwire/src/features/news/presentation/pages/sports_news_page.dart';
import 'package:buzzwire/src/features/news/presentation/pages/technology_news_page.dart';
import 'package:buzzwire/src/features/news/presentation/widgets/home_appbar.dart';
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
          body: NestedScrollView(
            controller: _scrollController,
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
    return SliverOverlapAbsorber(
      // This widget takes the overlapping behavior of the SliverAppBar,
      // and redirects it to the SliverOverlapInjector below. If it is
      // missing, then it is possible for the nested "inner" scroll view
      // below to end up under the SliverAppBar even when the inner
      // scroll view thinks it has not been scrolled.
      // This is not necessary if the "headerSliverBuilder" only builds
      // widgets that do not overlap the next sliver
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        pinned: false,
        floating: true,
        snap: true,
        forceElevated: innerBoxScrolled,
        flexibleSpace: const FlexibleSpaceBar(background: HomeAppBar()),
        bottom: _buildTabBar(context),
      ),
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
            child: BusinessNewsPage(
          category,
          _tabController,
        )),
      NewsCategory.entertainment =>
        KeepPageAlive(child: EntertainmentNewsPage(category, _tabController)),
      NewsCategory.general =>
        KeepPageAlive(child: GeneralNewsPage(category, _tabController)),
      NewsCategory.health =>
        KeepPageAlive(child: HealthNewsPage(category, _tabController)),
      NewsCategory.science =>
        KeepPageAlive(child: ScienceNewsPage(category, _tabController)),
      NewsCategory.sports =>
        KeepPageAlive(child: SportsNewsPage(category, _tabController)),
      NewsCategory.technology =>
        KeepPageAlive(child: TechnologyNewsPage(category, _tabController)),
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
