/// Validates password strength requirements.
class PasswordValidator {
  PasswordValidator._();

  static final RegExp _validPasswordRegExp = RegExp(r'^.{6,}$');

  /// Returns true if [password] meets the minimum length requirement (6+ characters).
  static bool isValid(String password) => _validPasswordRegExp.hasMatch(password);
}
