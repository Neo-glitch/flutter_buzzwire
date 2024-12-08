import 'package:buzzwire/core/error/exception.dart';

import 'api_key_interceptor.dart';
import 'dio_helper.dart';
import 'dio_logger_interceptor.dart';
import 'package:dio/dio.dart';

class DioClient {
  DioClient._();

  static final DioClient _instance = DioClient._();

  factory DioClient() => _instance;

  final Dio _dio = Dio(BaseOptions(
      baseUrl: BuzzWireDioHelper.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json))
    ..interceptors.addAll([ApiKeyInterceptor(), LoggerInterceptor()]);

  ///Get Method
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
      throw Exception("something went wrong");
    } catch (e) {
      rethrow;
    }
  }

  /// Post Method
  ///
  /// data: The data parameter represents the payload or body of the request. As you can see it was not added to the GET method because it does not need a body.
  ///
  /// queryParameters: The queryParameters parameter allows you to include query parameters in the URL of the request.
  ///
  /// options: The options parameter is an instance of the Options class that allows you to specify additional configuration options for the request. It includes properties like headers and followRedirects
  ///
  /// cancelToken: The cancelToken parameter is used to cancel the request if needed.
  ///
  /// onSendProgress: The onSendProgress parameter is a callback function that is called periodically during the sending phase of the request. It allows you to track the progress of the request being sent, which can be useful for displaying progress indicators or implementing upload progress tracking.
  ///
  /// onReceiveProgress: The onReceiveProgress parameter is a callback function that is called periodically during the receiving phase of the response. It enables you to track the progress of the response being received.
  Future<Map<String, dynamic>> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
      throw Exception("something went wrong");
    } catch (e) {
      rethrow;
    }
  }

  ///Put Method
  Future<Map<String, dynamic>> put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
      throw Exception("something went wrong");
    } catch (e) {
      rethrow;
    }
  }

  ///Delete Method
  Future<dynamic> delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      if (response.statusCode == 204) {
        return response.data;
      }
      throw Exception("something went wrong");
    } catch (e) {
      rethrow;
    }
  }

  // Helper example for handling exception
  //
  //  Future<Either<Exception, T>> _handleResponse<T>(
  //   Future<Response> request,
  // ) async {
  //   try {
  //     final response = await request;
  //     if (response.statusCode! >= 200 && response.statusCode! < 300) {
  //       final data = response.data;
  //       return right(data);
  //     } else {
  //       return left(ApiErrorHandler.handleError(response.data));
  //     }
  //   } catch (e) {
  //     return left(ApiErrorHandler.handleError(e));
  //   }
  // }

  // Future<Either<Exception, T>> get<T>(
  //   String url, {
  //   Map<String, dynamic>? queryParameters,
  // }) async {
  //   final request = dio.get(url,
  //       options: Options(headers: headers, validateStatus: (status) => true),
  //       queryParameters: {
  //         if (queryParameters != null) ...queryParameters,
  //       });
  //   return _handleResponse<T>(request);
  // }
}
