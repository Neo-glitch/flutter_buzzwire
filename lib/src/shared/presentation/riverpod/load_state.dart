sealed class LoadState {
  const LoadState();
}

class Empty extends LoadState {
  const Empty() : super();
}

class Loading extends LoadState {
  const Loading() : super();
}

class Loaded extends LoadState {
  const Loaded() : super();
}

class Error extends LoadState {
  final String message;

  const Error({required this.message}) : super();
}
