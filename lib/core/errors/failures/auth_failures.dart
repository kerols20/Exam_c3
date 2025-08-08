// lib/core/errors/failures/auth_failures.dart
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

  factory AuthenticationFailure.invalidPassword() => const AuthenticationFailure(
    message: 'Password is incorrect',
    userFriendlyMessage: 'The password you entered is incorrect. Please try again.',
    statusCode: 401,
    errorCode: 'INVALID_PASSWORD',
  );

  factory AuthenticationFailure.emailNotFound() => const AuthenticationFailure(
    message: 'Email not found',
    userFriendlyMessage: 'No account found with this email address.',
    statusCode: 404,
    errorCode: 'EMAIL_NOT_FOUND',
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


  factory AuthenticationFailure.missingToken() => const AuthenticationFailure(
    message: 'Authentication token is missing',
    userFriendlyMessage: 'You must be logged in to perform this action.',
    statusCode: 401,
    errorCode: 'MISSING_TOKEN',
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

  factory AuthorizationFailure.insufficientPrivileges() => const AuthorizationFailure(
    message: 'Insufficient privileges',
    userFriendlyMessage: 'Your account does not have the necessary privileges.',
    statusCode: 403,
    errorCode: 'INSUFFICIENT_PRIVILEGES',
  );
}
