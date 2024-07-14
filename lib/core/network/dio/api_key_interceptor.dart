import '../../constants/app_secrets.dart';
import 'dio_helper.dart';
import 'package:dio/dio.dart';

class ApiKeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['apikey'] = AppSecrets.newsApiKey;
    super.onRequest(options, handler); // continue with request
  }
}
