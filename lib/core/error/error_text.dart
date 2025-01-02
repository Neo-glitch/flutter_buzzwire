class ErrorText {
  ErrorText._();

  static const cancelError = "Request to the server was cancelled";
  static const connectionTimeoutError =
      "Unable to connect to server, please check your internet";
  static const receiveTimeoutError =
      "Unable to retreive data from the server, please check your internet";
  static const sendTimeoutError =
      "Unable to send data to server, please check your internet";
  static const badRequestError = "Bad request, try again later";
  static const unAuthorizedError = "User unauthorized, try again later";
  static const tooManyRequestError = "Too many requests, try again later";
  static const internalServerError = "Internal server error, try again later";
  static const noInternetError = "Please check your internet";
  static const cacheError = "Cache error, try again later";
  static const unknownError = "Oops! Something went wrong, try again later";
  static const unexpectedError = "An unexpected error occured, try again later";

  // For Firebase Auth related messages
  static const accountExistsError = "Email already exists. Go to login page";
  static const wrongAuthCredentialsError = "Wrong email/password combination";
  static const userNotFoundError = "No user found with this email";
  static const userDisabledError = "Account disabled";
  static const weakPassword = "Password should be at least 6 characters";
  static const accountTypeNotSupportedEror =
      "This type of account is not enabled";

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
}
