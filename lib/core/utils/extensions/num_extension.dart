extension IntExtension on int? {
  int get orZero {
    return this ?? 0;
  }
}

extension DoubleExtension on double? {
  double get orZero {
    return this ?? 0.0;
  }
}
