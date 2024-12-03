sealed class LoadState {}

class Empty extends LoadState {}

class Loading extends LoadState {}

class Loaded extends LoadState {}

class Error extends LoadState {
  final String message;

  Error({required this.message});
}
