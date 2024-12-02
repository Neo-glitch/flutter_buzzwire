import '../error_text.dart';

enum FbAuthErrorType {
  invalidEmail,
  userDisabled,
  userNotFound,
  wrongPassword,
  emailAlreadyInUse,
  accountypeNotSupported,
  weakPassword,
  unknown,
}

extension FirebaseAuthErrorCodeExtension on FbAuthErrorType {
  String get message {
    switch (this) {
      case FbAuthErrorType.invalidEmail:
      case FbAuthErrorType.wrongPassword:
        return ErrorText.wrongAuthCredentialsError;
      case FbAuthErrorType.userNotFound:
        return ErrorText.userNotFoundError;
      case FbAuthErrorType.userDisabled:
        return ErrorText.userDisabledError;
      case FbAuthErrorType.weakPassword:
        return ErrorText.weakPassword;
      case FbAuthErrorType.accountypeNotSupported:
        return ErrorText.accountTypeNotSupportedEror;
      case FbAuthErrorType.unknown:
      default:
        return ErrorText.unknownError;
    }
  }
}
