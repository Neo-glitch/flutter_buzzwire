extension NullableListExtension<T> on List<T>? {
  List<T> get orEmpty {
    return this ?? [];
  }

  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }
}
