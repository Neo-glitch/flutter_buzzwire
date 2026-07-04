import 'package:buzzwire/core/network/constant/network_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiKeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['apikey'] =
        dotenv.env[NetworkConstants.newsApiKey];
    super.onRequest(options, handler); // continue with request
  }
}
