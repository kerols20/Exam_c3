// Create: lib/core/errors/failures/server_failures.dart
import 'app_failure.dart';

class ServerFailure extends AppFailure {
  const ServerFailure({
    required super.message,
    required super.userFriendlyMessage,
    super.statusCode,
    super.errorCode,
  });

  factory ServerFailure.internalError() => const ServerFailure(
    message: 'Internal server error',
    userFriendlyMessage: 'Server error occurred. Please try again later.',
    statusCode: 500,
    errorCode: 'INTERNAL_ERROR',
  );

  factory ServerFailure.serviceUnavailable() => const ServerFailure(
    message: 'Service temporarily unavailable',
    userFriendlyMessage: 'Service is temporarily unavailable. Please try again later.',
    statusCode: 503,
    errorCode: 'SERVICE_UNAVAILABLE',
  );
}

class DataFailure extends AppFailure {
  const DataFailure({
    required super.message,
    required super.userFriendlyMessage,
    super.statusCode,
    super.errorCode,
  });

  factory DataFailure.notFound({String? resource}) => DataFailure(
    message: 'Resource not found: ${resource ?? 'unknown'}',
    userFriendlyMessage: 'The requested information was not found.',
    statusCode: 404,
    errorCode: 'NOT_FOUND',
  );
}

class UnknownFailure extends AppFailure {
  const UnknownFailure({
    required super.message,
    required super.userFriendlyMessage,
    super.statusCode,
    super.errorCode,
  });

  factory UnknownFailure.general() => const UnknownFailure(
    message: 'An unknown error occurred',
    userFriendlyMessage: 'Something went wrong. Please try again.',
    errorCode: 'UNKNOWN_ERROR',
  );
}