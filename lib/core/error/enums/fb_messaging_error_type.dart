import 'package:buzzwire/core/error/error_text.dart';

enum FbMessagingErrorType {
  internal,
  invalidRegistrationToken,
  tooManyRequests,
}

extension FirebaseMessagingErrorTypeExtension on FbMessagingErrorType {
  String get message {
    switch (this) {
      case FbMessagingErrorType.internal:
        return ErrorText.fcmInternalError;
      case FbMessagingErrorType.invalidRegistrationToken:
        return ErrorText.fcmInvalidRegistrationTokenError;
      case FbMessagingErrorType.tooManyRequests:
        return ErrorText.fcmTooManyRequestsError;
    }
  }
}
