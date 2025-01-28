import 'package:buzzwire/core/error/error_text.dart';

enum FbFireStoreErrorType {
  cancelled,
  unknown,
  invalidArgument,
  timeout,
  docNotFound,
  docAlreadyExists,
  permissionDenied,
  unAuthenticated,
  firebaseQuotaExhausted,
  failedPrecondition,
  operationAbortedOnConflict,
  dataOutOfRange,
  operationUnimplemented,
  internalError,
  serviceUnavailable,
  dataLoss,
}

extension FirebaseFirestoreErrorTypeExtension on FbFireStoreErrorType {
  String get message {
    switch (this) {
      case FbFireStoreErrorType.cancelled:
        return ErrorText.firestoreCancelledError;
      case FbFireStoreErrorType.unknown:
        return ErrorText.firestoreUnknownError;
      case FbFireStoreErrorType.invalidArgument:
        return ErrorText.firestoreInvalidArgumentError;
      case FbFireStoreErrorType.timeout:
        return ErrorText.firestoreTimeoutError;
      case FbFireStoreErrorType.docNotFound:
        return ErrorText.firestoreDocNotFoundError;
      case FbFireStoreErrorType.docAlreadyExists:
        return ErrorText.firestoreDocAlreadyExistsError;
      case FbFireStoreErrorType.permissionDenied:
        return ErrorText.firestorePermissionDeniedError;
      case FbFireStoreErrorType.unAuthenticated:
        return ErrorText.firestoreUnauthenticatedError;
      case FbFireStoreErrorType.firebaseQuotaExhausted:
        return ErrorText.firestoreQuotaExhaustedError;
      case FbFireStoreErrorType.failedPrecondition:
        return ErrorText.firestoreFailedPreconditionError;
      case FbFireStoreErrorType.operationAbortedOnConflict:
        return ErrorText.firestoreOperationAbortedOnConflictError;
      case FbFireStoreErrorType.dataOutOfRange:
        return ErrorText.firestoreDataOutOfRangeError;
      case FbFireStoreErrorType.operationUnimplemented:
        return ErrorText.firestoreOperationUnimplementedError;
      case FbFireStoreErrorType.internalError:
        return ErrorText.firestoreInternalError;
      case FbFireStoreErrorType.serviceUnavailable:
        return ErrorText.firestoreServiceUnavailableError;
      case FbFireStoreErrorType.dataLoss:
        return ErrorText.firestoreDataLossError;
    }
  }
}
