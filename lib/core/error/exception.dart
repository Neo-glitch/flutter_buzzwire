import 'package:buzzwire/core/error/error_text.dart';

class BaseException implements Exception {
  final String? message;

  BaseException({required this.message});

  @override
  String toString() => message ?? ErrorText.unknownError;
}

class ApiException extends BaseException {
  ApiException({required String message}) : super(message: message);
}

class FbAuthException extends BaseException {
  FbAuthException({required String message}) : super(message: message);
}

class FbFirestoreException extends BaseException {
  FbFirestoreException({required String message}) : super(message: message);
}

class CacheException extends BaseException {
  CacheException({required String message}) : super(message: message);
}
