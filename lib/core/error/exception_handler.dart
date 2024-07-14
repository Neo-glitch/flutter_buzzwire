import 'enums/fb_auth_error_type.dart';
import 'error_text.dart';
import 'firebase_error_codes.dart';
import 'exception.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExceptionHandler {
  ExceptionHandler._();

  static Exception handleException(Exception exception) {
    if (exception is DioException) {
      return _handleDioException(exception);
    } else if (exception is FirebaseAuthException) {
      return _handleFirebaseAuthException(exception);
    } else if (exception is FirebaseException) {
      return _handleFirebaseFirestoreException(exception);
    } else {
      return Exception(ErrorText.unknownError);
    }
  }

  static ApiException _handleDioException(DioException exception) {
    final message = switch (exception.type) {
      DioExceptionType.cancel => ErrorText.cancelError,
      DioExceptionType.connectionTimeout => ErrorText.connectionTimeoutError,
      DioExceptionType.receiveTimeout => ErrorText.receiveTimeoutError,
      DioExceptionType.sendTimeout => ErrorText.sendTimeoutError,
      DioExceptionType.badResponse =>
        _handleDioStatusCode(exception.response?.statusCode),
      DioExceptionType.unknown => _handleDioUnknownException(exception),
      _ => ErrorText.unknownError,
    };

    return ApiException(message: message);
  }

  static String _handleDioStatusCode(int? statusCode) {
    return switch (statusCode) {
      400 => ErrorText.badRequestError,
      401 => ErrorText.unAuthorizedError,
      429 => ErrorText.tooManyRequestError,
      500 => ErrorText.internalServerError,
      _ => ErrorText.unknownError,
    };
  }

  static String _handleDioUnknownException(DioException exception) {
    if (exception.message!.contains("SocketException")) {
      return ErrorText.noInternetError;
    }

    return ErrorText.unknownError;
  }

  static Exception _handleFirebaseAuthException(
    FirebaseAuthException exception,
  ) {
    final errorType = switch (exception.code) {
      invalidEmail => FbAuthErrorType.invalidEmail,
      userDisabled => FbAuthErrorType.userDisabled,
      userNotFound => FbAuthErrorType.userNotFound,
      wrongPassword => FbAuthErrorType.wrongPassword,
      emailAlreadyInUse => FbAuthErrorType.emailAlreadyInUse,
      accountNotEnabled => FbAuthErrorType.userDisabled,
      weakPassword => FbAuthErrorType.weakPassword,
      _ => FbAuthErrorType.unknown
    };

    return FbAuthException(message: errorType.message);
  }

  static Exception _handleFirebaseFirestoreException(
    FirebaseException exception,
  ) {
    // Todo handle firestore errors later
    return Exception(ErrorText.unknownError);
  }
}
