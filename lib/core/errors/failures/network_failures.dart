// Create: lib/core/errors/failures/network_failures.dart
import 'app_failure.dart';

class NetworkFailure extends AppFailure {
  const NetworkFailure({
    required super.message,
    required super.userFriendlyMessage,
    super.statusCode,
    super.errorCode,
  });

  factory NetworkFailure.connectionTimeout() => const NetworkFailure(
    message: 'Connection timeout occurred',
    userFriendlyMessage: 'Connection timed out. Please check your internet and try again.',
    errorCode: 'NETWORK_TIMEOUT',
  );

  factory NetworkFailure.noInternet() => const NetworkFailure(
    message: 'No internet connection',
    userFriendlyMessage: 'No internet connection. Please check your network and try again.',
    errorCode: 'NO_INTERNET',
  );
}

class TimeoutFailure extends AppFailure {
  const TimeoutFailure({
    required super.message,
    required super.userFriendlyMessage,
    super.statusCode,
    super.errorCode,
  });

  factory TimeoutFailure.sendTimeout() => const TimeoutFailure(
    message: 'Send timeout',
    userFriendlyMessage: 'Request timed out. Please try again.',
    errorCode: 'SEND_TIMEOUT',
  );

  factory TimeoutFailure.receiveTimeout() => const TimeoutFailure(
    message: 'Receive timeout',
    userFriendlyMessage: 'Server response timed out. Please try again.',
    errorCode: 'RECEIVE_TIMEOUT',
  );
}