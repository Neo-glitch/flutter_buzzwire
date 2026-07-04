/// Validates email address format.
class EmailValidator {
  EmailValidator._();

  static final RegExp _validEmailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  /// Returns true if [email] matches the expected email format.
  static bool isValid(String email) => _validEmailRegExp.hasMatch(email);
}
