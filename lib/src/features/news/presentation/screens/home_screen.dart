import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/navigation/route.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/src/features/news/presentation/categories.dart';
import 'package:buzzwire/src/features/news/presentation/pages/home_news_page.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/home_controller.dart';
import 'package:buzzwire/src/shared/domain/entity/user_entity.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_icon.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_profile_image.dart';
import 'package:buzzwire/src/shared/presentation/widgets/keep_alive_page.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    final cachedUser = ref.watch(homeControllerProvider);

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        body: SafeArea(
          child: ExtendedNestedScrollView(
            onlyOneScrollInBody: true,
            floatHeaderSlivers: true,
            // controller: _scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                _buildAppBar(context, innerBoxIsScrolled, cachedUser),
              ];
            },
            body: _buildTabBarView(),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(
    BuildContext context,
    bool innerBoxScrolled,
    UserEntity? cachedUser,
  ) {
    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: true,
      forceElevated: innerBoxScrolled,
      flexibleSpace: FlexibleSpaceBar(
        background: BuzzWireAppBar(
          title: const BuzzWireAppIcon(
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          actions: [
            IconButton(
              onPressed: () =>
                  context.pushNamed(BuzzWireRoute.editProfileScreen.name),
              icon: BuzzWireProfileImage(
                radius: 16,
                imageUrl: cachedUser?.profileImage?.imageUrl.orEmpty,
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
