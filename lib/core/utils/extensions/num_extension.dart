extension NullableIntExtension on int? {
  int get orZero {
    return this ?? 0;
  }
}

extension NullableDoubleExtension on double? {
  double get orZero {
    return this ?? 0.0;
  }
}
