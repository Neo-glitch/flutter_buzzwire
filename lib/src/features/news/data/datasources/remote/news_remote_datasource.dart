import 'package:buzzwire/core/common/logging/logger_helper.dart';
import 'package:buzzwire/core/network/constant/network_constants.dart';
import 'package:buzzwire/src/features/news/data/datasources/remote/api/news_api_service.dart';
import 'package:buzzwire/src/features/news/data/model/news_model.dart';
import 'package:buzzwire/src/features/news/data/model/news_source_model.dart';

abstract class NewsRemoteDataSource {
  Future<NewsSourceModel> getNewsSources();
  Future<NewsModel> getHeadlines();
  Future<NewsModel> getHeadlinesByCategory(
      {required int page, required String category});
  Future<NewsModel> getNews({required String query, required int page});
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final NewsApiService newsApiService;

  NewsRemoteDataSourceImpl({required this.newsApiService});

  @override
  Future<NewsModel> getNews({required String query, required int page}) async {
    try {
      return await newsApiService.getNews(
        query: query,
        language: 'en',
        sortBy: 'publishedAt',
        page: page,
        pageSize: NetworkConstants.pageSize,
      );
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<NewsModel> getHeadlines() async {
    try {
      return await newsApiService.getHeadlines(
        country: 'us',
        page: 1,
        pageSize: 8,
      );
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<NewsModel> getHeadlinesByCategory({
    required int page,
    required String category,
  }) async {
    try {
      return await newsApiService.getHeadlinesByCategory(
        country: 'us',
        page: page,
        category: category,
        pageSize: NetworkConstants.pageSize,
      );
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<NewsSourceModel> getNewsSources() async {
    try {
      return await newsApiService.getNewsSources(language: 'en');
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }
}
