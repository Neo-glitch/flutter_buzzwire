import 'package:buzzwire/core/network/constant/network_constants.dart';
import 'package:buzzwire/src/features/news/data/datasources/remote/api/news_api_service.dart';
import 'package:buzzwire/src/features/news/data/datasources/remote/news_remote_datasource.dart';
import 'package:buzzwire/src/features/news/data/model/news_model.dart';
import 'package:buzzwire/src/features/news/data/model/news_source_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final NewsApiService newsApiService;

  NewsRemoteDataSourceImpl({required this.newsApiService});

  @override
  Future<NewsModel> getNews({required String query, required int page}) async {
    return await newsApiService.getNews(
      query: query,
      language: 'en',
      sortBy: 'publishedAt',
      page: page,
      pageSize: NetworkConstants.pageSize,
    );
  }

  @override
  Future<NewsModel> getHeadlines() async {
    return await newsApiService.getHeadlines(
      country: 'us',
      page: 1,
      pageSize: 8,
    );
  }

  @override
  Future<NewsModel> getHeadlinesByCategory({
    required int page,
    required String category,
  }) async {
    return await newsApiService.getHeadlinesByCategory(
      country: 'us',
      page: page,
      category: category,
      pageSize: NetworkConstants.pageSize,
    );
  }

  @override
  Future<NewsSourceModel> getNewsSources() async {
    return await newsApiService.getNewsSources(language: 'en');
  }
}
