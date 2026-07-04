import 'package:buzzwire/core/network/constant/network_constants.dart';
import 'package:buzzwire/src/features/news/data/model/news_model.dart';
import 'package:buzzwire/src/features/news/data/model/news_source_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi()
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET(NetworkConstants.sources)
  Future<NewsSourceModel> getNewsSources({
    @Query('language') required String language,
  });

  @GET(NetworkConstants.headlines)
  Future<NewsModel> getHeadlines({
    @Query('country') required String country,
    @Query('page') required int page,
    @Query('pageSize') required int pageSize,
  });

  @GET(NetworkConstants.headlines)
  Future<NewsModel> getHeadlinesByCategory({
    @Query('country') required String country,
    @Query('page') required int page,
    @Query('category') required String category,
    @Query('pageSize') required int pageSize,
  });

  @GET(NetworkConstants.news)
  Future<NewsModel> getNews({
    @Query('q') required String query,
    @Query('language') required String language,
    @Query('sortBy') required String sortBy,
    @Query('page') required int page,
    @Query('pageSize') required int pageSize,
  });
}
