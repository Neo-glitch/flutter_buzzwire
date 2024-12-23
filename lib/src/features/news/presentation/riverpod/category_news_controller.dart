import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/core/network/dio/dio_helper.dart';
import 'package:buzzwire/core/utils/extensions/list_extension.dart';
import 'package:buzzwire/core/utils/extensions/num_extension.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_headlines_by_category_usecase.dart';
import 'package:buzzwire/src/features/news/presentation/riverpod/category_news_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_news_controller.g.dart';

@riverpod
class CategoryNewsController extends _$CategoryNewsController {
  late GetHeadlinesByCategory _getNewsHeadlines;
  late String _category;

  @override
  CategoryNewsState build(String category) {
    _getNewsHeadlines = injector();
    _category = category;
    return const CategoryNewsState();
  }

  void fetchNews(int page) async {
    if (state.loadState is Loading || state.currentPage > state.lastPage) {
      return;
    }

    final previousPage = state.currentPage;
    state = state.copyWith(loadState: const Loading(), currentPage: page);
    final response = await _getNewsHeadlines(
        GetHeadlinesByCategoryParams(page: page, category: _category));

    response.fold(
      (error) => state = state.copyWith(
          loadState: Error(message: error.message), currentPage: previousPage),
      (result) {
        final lastPage =
            (result.totalResults.orZero / BuzzWireDioHelper.pageSize).ceil();
        final articles = page > 1
            ? state.articles.toList() + result.articles.orEmpty
            : result.articles.orEmpty;
        state = state.copyWith(
          currentPage: page,
          lastPage: lastPage,
          articles: articles,
          loadState: const Loaded(),
        );
      },
    );
  }
}
