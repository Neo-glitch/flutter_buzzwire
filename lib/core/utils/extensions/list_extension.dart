extension NullableListExtension<T> on List<T>? {
  List<T> get orEmpty {
    return this ?? [];
  }

  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }
}

extension ListExtension<T> on List<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
