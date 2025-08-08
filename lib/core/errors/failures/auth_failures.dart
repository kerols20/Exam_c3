// Create: lib/core/errors/failures/auth_failures.dart
import 'app_failure.dart';

class AuthenticationFailure extends AppFailure {
  const AuthenticationFailure({
    required super.message,
    required super.userFriendlyMessage,
    super.statusCode,
    super.errorCode,
  });

  factory AuthenticationFailure.invalidCredentials() => const AuthenticationFailure(
    message: 'Invalid credentials provided',
    userFriendlyMessage: 'Invalid email or password. Please try again.',
    statusCode: 401,
    errorCode: 'INVALID_CREDENTIALS',
  );

  factory AuthenticationFailure.tokenExpired() => const AuthenticationFailure(
    message: 'Authentication token expired',
    userFriendlyMessage: 'Your session has expired. Please login again.',
    statusCode: 401,
    errorCode: 'TOKEN_EXPIRED',
  );

  factory AuthenticationFailure.invalidToken() => const AuthenticationFailure(
    message: 'Invalid authentication token',
    userFriendlyMessage: 'Authentication failed. Please login again.',
    statusCode: 401,
    errorCode: 'INVALID_TOKEN',
  );
}

class AuthorizationFailure extends AppFailure {
  const AuthorizationFailure({
    required super.message,
    required super.userFriendlyMessage,
    super.statusCode,
    super.errorCode,
  });

  factory AuthorizationFailure.accessDenied() => const AuthorizationFailure(
    message: 'Access denied to resource',
    userFriendlyMessage: "You don't have permission to perform this action.",
    statusCode: 403,
    errorCode: 'ACCESS_DENIED',
  );
}