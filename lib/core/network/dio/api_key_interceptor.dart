import 'package:buzzwire/core/constants/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiKeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['apikey'] =
        dotenv.env[BuzzWireAppConstants.newsApiKey];
    super.onRequest(options, handler); // continue with request
  }
}
