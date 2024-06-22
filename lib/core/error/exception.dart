import 'package:dio/dio.dart';

/// handles errors pertaining to Dio Network Call
class DioException implements Exception {
  late String message;

  DioException.fromDioError(DioError dioError) {
    message = switch (dioError) {
      DioErrorType.cancel => "Request to the serve was cancelled",
      DioErrorType.connectionTimeout => "Connection timed out",
      DioErrorType.receiveTimeout => "Receiving timeout occurred",
      DioErrorType.sendTimeout => "Request send timeout",
      DioErrorType.badResponse =>
        _handleStatusCode(dioError.response?.statusCode),
      DioErrorType.unknown => _handleUnknownError(dioError),
      _ => "Oops something went wrong",
    };
  }

  String _handleStatusCode(int? statusCode) {
    return switch (statusCode) {
      400 => "Request not allowed",
      401 => "Authentication failed",
      429 => "Too many requests",
      500 => "Internal server error",
      _ => "Oops something went wrong",
    };
  }

  String _handleUnknownError(DioError error) {
    if (error.message!.contains("SocketException")) {
      return "No internet";
    }

    return "Unexpected error occured";
  }

  @override
  String toString() => message;
}
