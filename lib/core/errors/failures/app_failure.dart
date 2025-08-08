// Create: lib/core/errors/failures/app_failure.dart
import 'package:equatable/equatable.dart';

abstract class AppFailure extends Equatable {
  final String message;
  final String userFriendlyMessage;
  final int? statusCode;
  final String? errorCode;
  
  const AppFailure({
    required this.message,
    required this.userFriendlyMessage,
    this.statusCode,
    this.errorCode,
  });

  @override
  List<Object?> get props => [message, userFriendlyMessage, statusCode, errorCode];
}