import 'package:buzzwire/core/constants/api_constants.dart';
import 'package:buzzwire/core/network/dio/dio_helper.dart';
import 'package:dio/dio.dart';

class ApiKeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['apikey'] = APIConstants.newsApiKey;
    super.onRequest(options, handler); // continue with request
  }
}
