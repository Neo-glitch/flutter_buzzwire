extension NullableBoolExtension on bool? {
  bool get orFalse {
    return this ?? false;
  }
}
