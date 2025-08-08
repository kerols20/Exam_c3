// Create: lib/core/errors/handlers/auth_error_handler.dart
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import '../failures/app_failure.dart';
import '../failures/network_failures.dart';
import '../failures/auth_failures.dart';
import '../failures/validation_failures.dart';
import '../failures/server_failures.dart';

@injectable
class AuthErrorHandler {
  Result<T> handleSignInError<T>(Exception error) {
    if (error is DioException) {
      return Failure(_mapSignInError(error));
    }
    return Failure(UnknownFailure.general());
  }

  Result<T> handleSignUpError<T>(Exception error) {
    if (error is DioException) {
      return Failure(_mapSignUpError(error));
    }
    return Failure(UnknownFailure.general());
  }

  Result<T> handleForgotPasswordError<T>(Exception error) {
    if (error is DioException) {
      return Failure(_mapForgotPasswordError(error));
    }
    return Failure(UnknownFailure.general());
  }

  Result<T> handleVerifyCodeError<T>(Exception error) {
    if (error is DioException) {
      return Failure(_mapVerifyCodeError(error));
    }
    return Failure(UnknownFailure.general());
  }

  Result<T> handleResetPasswordError<T>(Exception error) {
    if (error is DioException) {
      return Failure(_mapResetPasswordError(error));
    }
    return Failure(UnknownFailure.general());
  }
  Result<T> handle<T>(Exception error) {
    if (error is DioException) {
      return Failure(_mapGeneralError(error));
    }
    return Failure(UnknownFailure.general());
  }

  AppFailure _mapGeneralError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure.connectionTimeout();

      case DioExceptionType.connectionError:
        return NetworkFailure.noInternet();

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final serverMessage = error.response?.data['message']?.toString().toLowerCase() ?? '';

        switch (statusCode) {
          case 400:
            return ValidationFailure.invalidRqaust();
          case 401:
            if (serverMessage.contains('token') && serverMessage.contains('missing')) {
              return AuthenticationFailure.missingToken();
            }
            if (serverMessage.contains('token') && serverMessage.contains('expired')) {
              return AuthenticationFailure.tokenExpired();
            }
            if (serverMessage.contains('invalid token')) {
              return AuthenticationFailure.invalidToken();
            }
            return AuthenticationFailure.invalidCredentials();

          case 403:
            if (serverMessage.contains('privilege') || serverMessage.contains('permission')) {
              return AuthorizationFailure.insufficientPrivileges();
            }
            return AuthorizationFailure.accessDenied();

          case 404:
            return ValidationFailure.passwordMismatch();

          case 500:
            return ServerFailure.internalError();

          default:
            return UnknownFailure.general();
        }

      default:
        return UnknownFailure.general();
    }
  }
  AppFailure _mapSignInError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure.connectionTimeout();

      case DioExceptionType.connectionError:
        return NetworkFailure.noInternet();

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final serverMessage = error.response?.data['message']?.toString().toLowerCase() ?? '';
        if (serverMessage.contains('password') && serverMessage.contains('incorrect')) {
          return AuthenticationFailure.invalidPassword();
        }
        if (serverMessage.contains('email') && serverMessage.contains('not found')) {
          return AuthenticationFailure.emailNotFound();
        }
        switch (statusCode) {
          case 400:
          case 401:
            return AuthenticationFailure.invalidCredentials();
          case 500:
            return ServerFailure.internalError();
          default:
            return UnknownFailure.general();
        }
      default:
        return UnknownFailure.general();
    }
  }


  AppFailure _mapSignUpError(DioException error) {
    if (error.response?.data['message']?.toString().contains('exists') ?? false) {
      return ValidationFailure.emailExists();
    }
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure.connectionTimeout();
      case DioExceptionType.connectionError:
        return NetworkFailure.noInternet();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case 400:
          case 409:
          case 422:
            return ValidationFailure.emailExists();
          case 500:
            return ServerFailure.internalError();
          default:
            return UnknownFailure.general();
        }
      default:
        return UnknownFailure.general();
    }
  }


  AppFailure _mapForgotPasswordError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure.connectionTimeout();
      case DioExceptionType.connectionError:
        return NetworkFailure.noInternet();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case 400:
            return ValidationFailure.invalidEmail();
          case 500:
            return ServerFailure.internalError();
          default:
            return UnknownFailure.general();
        }
      default:
        return UnknownFailure.general();
    }
  }

  AppFailure _mapVerifyCodeError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure.connectionTimeout();
      case DioExceptionType.connectionError:
        return NetworkFailure.noInternet();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case 400:
            return const ValidationFailure(
              message: 'Invalid verification code',
              userFriendlyMessage: 'Invalid or expired verification code. Please try again.',
              statusCode: 400,
              errorCode: 'INVALID_CODE',
            );
          case 500:
            return ServerFailure.internalError();
          default:
            return UnknownFailure.general();
        }
      default:
        return UnknownFailure.general();
    }
  }

  AppFailure _mapResetPasswordError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure.connectionTimeout();
      case DioExceptionType.connectionError:
        return NetworkFailure.noInternet();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case 400:
            return const ValidationFailure(
              message: 'Password reset failed',
              userFriendlyMessage: 'Invalid reset code or password requirements not met.',
              statusCode: 400,
              errorCode: 'RESET_FAILED',
            );
          case 500:
            return ServerFailure.internalError();
          default:
            return UnknownFailure.general();
        }
      default:
        return UnknownFailure.general();
    }
  }
}
