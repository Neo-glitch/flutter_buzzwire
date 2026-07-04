extension NullableStringExtension on String? {
  String get orEmpty {
    return this ?? "";
  }
}
