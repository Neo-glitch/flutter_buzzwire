import 'dart:ffi';

extension BoolExtension on bool? {
  bool get orFalse {
    return this ?? false;
  }
}
