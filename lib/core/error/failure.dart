class Failure {
  final String message;

  Failure([this.message = "An Unexpected error occured"]);
}

class DioFailure extends Failure {
  final String failureMessage;
  DioFailure(this.failureMessage) : super(failureMessage);
}
