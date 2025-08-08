// Create: lib/core/errors/failures/validation_failures.dart
import 'app_failure.dart';

class ValidationFailure extends AppFailure {
  const ValidationFailure({
    required super.message,
    required super.userFriendlyMessage,
    super.statusCode,
    super.errorCode,
  });

  factory ValidationFailure.emailExists() => const ValidationFailure(
    message: 'Email already exists',
    userFriendlyMessage: 'This email is already registered. Please use a different email.',
    statusCode: 400,
    errorCode: 'EMAIL_EXISTS',
  );
  factory ValidationFailure.invalidRqaust() => const ValidationFailure(
    message: 'Invalid Rquset',
    userFriendlyMessage: 'Invalid Rquset',
    statusCode: 400,
    errorCode: 'INVALID_RQUST',
  );

  factory ValidationFailure.invalidEmail() => const ValidationFailure(
    message: 'Invalid email address',
    userFriendlyMessage: 'Please enter a valid email address.',
    statusCode: 400,
    errorCode: 'INVALID_EMAIL',
  );

  factory ValidationFailure.passwordMismatch() => const ValidationFailure(
    message: 'Password confirmation does not match',
    userFriendlyMessage: 'Passwords do not match. Please try again.',
    statusCode: 400,
    errorCode: 'PASSWORD_MISMATCH',
  );
}