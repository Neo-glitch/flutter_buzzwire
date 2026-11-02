import 'package:buzzwire/core/common/logging/logger_helper.dart';
import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sqflite/sqflite.dart';

import 'constant/error_text.dart';
import 'exception.dart';
import 'constant/firebase_error_codes.dart';

class ExceptionHandler {
  ExceptionHandler._();

  static AppException handleException(Exception exception) {
    BuzzWireLoggerHelper.error(exception.toString());
    return switch (exception) {
      DioException e => _handleDioException(e),
      FirebaseAuthException e => _handleFirebaseAuthException(e),
      FirebaseException e => _handleFirebaseException(e),
      DatabaseException e => _handleDatabaseException(e),
      _ => AppException(message: ErrorText.unknownError),
    };
  }

  static Failure toFailure(Exception exception) {
    final e = handleException(exception);
    return switch (e) {
      ApiException() => ApiFailure(e.message),
      FbAuthException() => FbAuthFailure(e.message),
      FbFirebaseException() => FbFailure(e.message),
      CacheException() => CacheFailure(e.message),
      _ => Failure(e.message),
    };
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

  static FbAuthException _handleFirebaseAuthException(
    FirebaseAuthException exception,
  ) {
    final message = switch (exception.code) {
      invalidEmail || wrongPassword || userMismatch =>
        ErrorText.wrongAuthCredentialsError,
      userNotFound => ErrorText.userNotFoundError,
      userDisabled || accountNotEnabled => ErrorText.userDisabledError,
      weakPassword => ErrorText.weakPassword,
      emailAlreadyInUse => ErrorText.accountExistsError,
      _ => ErrorText.unknownError,
    };

    return FbAuthException(message: message);
  }

  static FbFirebaseException _handleFirebaseException(
    FirebaseException exception,
  ) {
    final message = switch (exception.code) {
      cancelled || storageCancelled => ErrorText.firestoreCancelledError,
      invalidArgument => ErrorText.firestoreInvalidArgumentError,
      timeout || storageRetryLimitExceeded => ErrorText.firestoreTimeoutError,
      docNotFound => ErrorText.firestoreDocNotFoundError,
      docAlreadyExists => ErrorText.firestoreDocAlreadyExistsError,
      permissionDenied || storageUnauthorized => ErrorText.firestorePermissionDeniedError,
      unauthenticated => ErrorText.firestoreUnauthenticatedError,
      firebaseQuotaExhausted || storageQuotaExceeded => ErrorText.firestoreQuotaExhaustedError,
      failedPrecondition => ErrorText.firestoreFailedPreconditionError,
      operationAbortedOnConflict =>
        ErrorText.firestoreOperationAbortedOnConflictError,
      dataOutOfRange => ErrorText.firestoreDataOutOfRangeError,
      operationUnimplemented => ErrorText.firestoreOperationUnimplementedError,
      internalError => ErrorText.firestoreInternalError,
      serviceUnavailable => ErrorText.firestoreServiceUnavailableError,
      dataLoss => ErrorText.firestoreDataLossError,
      _ => ErrorText.firestoreUnknownError,
    };

    return FbFirebaseException(message: message);
  }
}
