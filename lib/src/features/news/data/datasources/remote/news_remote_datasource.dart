import 'package:buzzwire/src/features/news/data/model/news_model.dart';
import 'package:buzzwire/src/features/news/data/model/news_source_model.dart';

abstract class NewsRemoteDataSource {
  Future<NewsSourceModel> getNewsSources();
  Future<NewsModel> getHeadlines();
  Future<NewsModel> getHeadlinesByCategory(
      {required int page, required String category});
  Future<NewsModel> getNews({required String query, required int page});
}
