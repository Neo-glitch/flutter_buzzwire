class ErrorText {
  ErrorText._();

  static const cancelError = "Request to the server was cancelled";
  static const connectionTimeoutError =
      "Unable to connect to server, please check your internet";
  static const receiveTimeoutError =
      "Unable to retreive data from the server, please check your internet";
  static const sendTimeoutError =
      "Unable to send data to server, please check your internet";
  static const badRequestError = "Something went wrong. Please try again.";
  static const unAuthorizedError =
      "You’re not authorized. Please log in and try again.";
  static const tooManyRequestError =
      "Too many attempts. Please wait a moment and try again.";
  static const internalServerError =
      "We’re experiencing server issues. Please try again later.";
  static const noInternetError =
      "No internet connection. Check your network and try again.";
  static const cacheError = "A temporary error occurred. Please try again.";
  static const unknownError = "Something went wrong. Please try again.";
  static const unexpectedError =
      "An unexpected error occurred. Please try again.";

  // For Firebase Auth related messages
  static const accountExistsError =
      "The email address you entered is already associated with an existing account. Please use a different email or log in to your existing account";
  static const wrongAuthCredentialsError =
      "The email or password you entered is incorrect. Please check your credentials and try again";
  static const userNotFoundError =
      "No account found with this email. Please check your email or sign up.";
  static const userDisabledError =
      "Your account has been disabled. Contact support for assistance.";
  static const weakPassword =
      "Your password must be at least 6 characters long.";
  static const accountTypeNotSupportedEror =
      "This account type is not supported. Please use a different method.";

  // For cloud Firestore related errors
  static const String firestoreCancelledError =
      "The operation was cancelled. Please try again.";
  static const String firestoreUnknownError =
      "An unknown error occurred. Please contact support if this continues.";
  static const String firestoreInvalidArgumentError =
      "Invalid input provided. Please check your data and try again.";
  static const String firestoreTimeoutError =
      "The operation timed out. Please check your network connection and try again.";
  static const String firestoreDocNotFoundError =
      "The requested document was not found. It may have been removed.";
  static const String firestoreDocAlreadyExistsError =
      "A document with this ID already exists. Please use a different ID.";
  static const String firestorePermissionDeniedError =
      "You do not have permission to perform this action. Please contact the administrator.";
  static const String firestoreUnauthenticatedError =
      "You are not authenticated. Please log in to continue.";
  static const String firestoreQuotaExhaustedError =
      "The quota for this service has been exceeded. Please try again later.";
  static const String firestoreFailedPreconditionError =
      "The operation failed due to unmet preconditions. Please try again.";
  static const String firestoreOperationAbortedOnConflictError =
      "The operation was aborted due to a conflict. Please retry.";
  static const String firestoreDataOutOfRangeError =
      "Data is out of the valid range. Please check your input.";
  static const String firestoreOperationUnimplementedError =
      "This operation is not supported. Please contact support.";
  static const String firestoreInternalError =
      "An internal error occurred. Please try again later.";
  static const String firestoreServiceUnavailableError =
      "The service is currently unavailable. Please check your connection and try again.";
  static const String firestoreDataLossError =
      "Data corruption detected. Please contact support immediately.";

  static const String fcmInternalError =
      "An internal error occurred. Please try again later.";
  static const String fcmInvalidRegistrationTokenError =
      "The device token is invalid. Please check your FCM configuration.";
  static const String fcmTooManyRequestsError =
      "Too many requests have been sent. Please wait and try again later.";
}
