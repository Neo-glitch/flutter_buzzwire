import 'package:buzzwire/core/error/enums/fb_firestore_error_type.dart';
import 'package:buzzwire/core/utils/logging/logger_helper.dart';
import 'package:sqflite/sqflite.dart';

import 'enums/fb_auth_error_type.dart';
import 'error_text.dart';
import 'firebase_error_codes.dart';
import 'exception.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExceptionHandler {
  ExceptionHandler._();

  static Exception handleException(Exception exception) {
    BuzzWireLoggerHelper.error(exception.toString());
    if (exception is DioException) {
      return _handleDioException(exception);
    } else if (exception is FirebaseAuthException) {
      return _handleFirebaseAuthException(exception);
    } else if (exception is FirebaseException) {
      return _handleFirebaseException(exception);
    } else if (exception is DatabaseException) {
      return _handleDatabaseException(exception);
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
      DioExceptionType.connectionError => ErrorText.noInternetError,
      DioExceptionType.unknown => _handleDioUnknownException(exception),
      _ => ErrorText.unknownError,
    };

    return ApiException(message: message);
  }

  static CacheException _handleDatabaseException(DatabaseException exception) {
    return CacheException(message: ErrorText.unknownError);
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
      userMismatch => FbAuthErrorType.userMismatch,
      _ => FbAuthErrorType.unknown
    };

    return FbAuthException(message: errorType.message);
  }

  static Exception _handleFirebaseException(
    FirebaseException exception,
  ) {
    final errorType = switch (exception.code) {
      cancelled => FbFireStoreErrorType.cancelled,
      unknown => FbFireStoreErrorType.unknown,
      invalidArgument => FbFireStoreErrorType.invalidArgument,
      timeout => FbFireStoreErrorType.timeout,
      docNotFound => FbFireStoreErrorType.docNotFound,
      docAlreadyExists => FbFireStoreErrorType.docAlreadyExists,
      permissionDenied => FbFireStoreErrorType.permissionDenied,
      unauthenticated => FbFireStoreErrorType.unAuthenticated,
      firebaseQuotaExhausted => FbFireStoreErrorType.firebaseQuotaExhausted,
      failedPrecondition => FbFireStoreErrorType.failedPrecondition,
      operationAbortedOnConflict =>
        FbFireStoreErrorType.operationAbortedOnConflict,
      dataOutOfRange => FbFireStoreErrorType.dataOutOfRange,
      operationUnimplemented => FbFireStoreErrorType.operationUnimplemented,
      internalError => FbFireStoreErrorType.internalError,
      serviceUnavailable => FbFireStoreErrorType.serviceUnavailable,
      dataLoss => FbFireStoreErrorType.dataLoss,
      _ => FbFireStoreErrorType.unknown
    };
    return FbFirebaseException(message: errorType.message);
  }
}
