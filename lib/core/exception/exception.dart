class AppException implements Exception {
  final String message;

  AppException({required this.message});

  @override
  String toString() => message;
}

class ApiException extends AppException {
  ApiException({required super.message});
}

class FbAuthException extends AppException {
  FbAuthException({required super.message});
}

class FbFirebaseException extends AppException {
  FbFirebaseException({required super.message});
}

class CacheException extends AppException {
  CacheException({required super.message});
}
