abstract class Resource<T> {
  final T? data;
  final String? errorMessage;

  const Resource({this.data, this.errorMessage});
}

class Success<T> extends Resource {
  Success(T? data) : super(data: data);
}

class Error<T> extends Resource {
  Error(String message) : super(errorMessage: message);
}
