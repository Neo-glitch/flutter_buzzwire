import 'package:buzzwire/core/network/dio/dio_client.dart';
import 'package:buzzwire/core/network/dio/dio_helper.dart';
import 'package:buzzwire/core/utils/logging/logger_helper.dart';
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
  final DioClient dioClient;

  NewsRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<NewsModel> getNews({required String query, required int page}) async {
    try {
      final response = await dioClient.get(
        BuzzWireDioHelper.news,
        queryParameters: {
          "q": query,
          "language": "en",
          "sortBy": "publishedAt",
          "page": page,
          "pageSize": BuzzWireDioHelper.pageSize,
        },
      );
      return NewsModel.fromJson(response);
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<NewsModel> getHeadlines() async {
    try {
      final response = await dioClient.get(
        BuzzWireDioHelper.headlines,
        queryParameters: {
          "country": "us",
          "page": 1,
          "pageSize": 5,
        },
      );
      return NewsModel.fromJson(response);
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
      final response = await dioClient.get(
        BuzzWireDioHelper.headlines,
        queryParameters: {
          "country": "us",
          "page": page,
          "category": category,
          "pageSize": BuzzWireDioHelper.pageSize,
        },
      );
      return NewsModel.fromJson(response);
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<NewsSourceModel> getNewsSources() async {
    try {
      final response = await dioClient.get(
        BuzzWireDioHelper.sources,
        queryParameters: {
          "language": "en",
        },
      );
      return NewsSourceModel.fromJson(response);
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }
}
