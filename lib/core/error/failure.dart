class Failure {
  final String message;

  Failure([this.message = "An Unexpected error occured"]);
}

class ApiFailure extends Failure {
  ApiFailure(super.message);
}

class FbAuthFailure extends Failure {
  FbAuthFailure(super.message);
}

class FbFailure extends Failure {
  FbFailure(super.message);
}

class SupabaseStorageFailure extends Failure {
  SupabaseStorageFailure(super.message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}
