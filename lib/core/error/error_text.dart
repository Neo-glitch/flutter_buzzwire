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
  // static con
}
