import 'dart:async';

class ReusableStreamController<T> {
  StreamController<T>? _controller;

  Stream<T> get stream => _controller?.stream ?? Stream<T>.empty();

  void add(T data) {
    if (_controller == null || _controller!.isClosed) {
      _controller = StreamController<T>.broadcast(); // Create a new controller
    }
    _controller!.add(data);
  }

  void close() {
    _controller?.close();
    _controller = null; // Clear the reference
  }
}
