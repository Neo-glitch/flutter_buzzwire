import 'package:injectable/injectable.dart';

import '../../../../core/network/dio/dio_client.dart';
import '../data/datasources/remote/api/news_api_service.dart';

@module
abstract class NewsModule {
  @lazySingleton
  NewsApiService newsApiService(DioClient client) => NewsApiService(client.dio);
}
