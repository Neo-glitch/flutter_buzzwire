extension StringExtension on String {
  static final RegExp _validEmailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  static final RegExp _validPasswordRegExp = RegExp(r'^.{6,}$');

  isValidEmail() => _validEmailRegExp.hasMatch(this);
  isValidPassword() => _validPasswordRegExp.hasMatch(this);
  String get toCapitalized =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String get toTitleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized)
      .join(' ');
}

extension NullableStringExtension on String? {
  String get orEmpty {
    return this ?? "";
  }
}
