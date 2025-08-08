// Create: lib/core/errors/handlers/home_error_handler.dart
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import '../failures/app_failure.dart';
import '../failures/network_failures.dart';
import '../failures/auth_failures.dart';
import '../failures/validation_failures.dart';
import '../failures/server_failures.dart';

@injectable
class HomeErrorHandler {
  Result<T> handleGetSubjectsError<T>(Exception error) {
    if (error is DioException) {
      return Failure(_mapGetSubjectsError(error));
    }
    return Failure(UnknownFailure.general());
  }

  Result<T> handleGetExamsError<T>(Exception error) {
    if (error is DioException) {
      return Failure(_mapGetExamsError(error));
    }
    return Failure(UnknownFailure.general());
  }

  Result<T> handleGetQuestionsError<T>(Exception error) {
    if (error is DioException) {
      return Failure(_mapGetQuestionsError(error));
    }
    return Failure(UnknownFailure.general());
  }

  Result<T> handleGetUserInfoError<T>(Exception error) {
    if (error is DioException) {
      return Failure(_mapGetUserInfoError(error));
    }
    return Failure(UnknownFailure.general());
  }

  Result<T> handleEditProfileError<T>(Exception error) {
    if (error is DioException) {
      return Failure(_mapEditProfileError(error));
    }
    return Failure(UnknownFailure.general());
  }

  Result<T> handleChangePasswordError<T>(Exception error) {
    if (error is DioException) {
      return Failure(_mapChangePasswordError(error));
    }
    return Failure(UnknownFailure.general());
  }

  AppFailure _mapGetSubjectsError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure.connectionTimeout();
      case DioExceptionType.connectionError:
        return NetworkFailure.noInternet();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case 401:
            return AuthenticationFailure.tokenExpired();
          case 404:
            return DataFailure.notFound(resource: 'subjects');
          case 500:
            return ServerFailure.internalError();
          default:
            return UnknownFailure.general();
        }
      default:
        return UnknownFailure.general();
    }
  }

  AppFailure _mapGetExamsError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure.connectionTimeout();
      case DioExceptionType.connectionError:
        return NetworkFailure.noInternet();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case 401:
            return AuthenticationFailure.tokenExpired();
          case 404:
            return DataFailure.notFound(resource: 'exams');
          case 500:
            return ServerFailure.internalError();
          default:
            return UnknownFailure.general();
        }
      default:
        return UnknownFailure.general();
    }
  }

  AppFailure _mapGetQuestionsError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure.connectionTimeout();
      case DioExceptionType.connectionError:
        return NetworkFailure.noInternet();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case 401:
            return AuthenticationFailure.tokenExpired();
          case 404:
            return DataFailure.notFound(resource: 'questions');
          case 500:
            return ServerFailure.internalError();
          default:
            return UnknownFailure.general();
        }
      default:
        return UnknownFailure.general();
    }
  }

  AppFailure _mapGetUserInfoError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure.connectionTimeout();
      case DioExceptionType.connectionError:
        return NetworkFailure.noInternet();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case 401:
            return AuthenticationFailure.tokenExpired();
          case 404:
            return DataFailure.notFound(resource: 'user information');
          case 500:
            return ServerFailure.internalError();
          default:
            return UnknownFailure.general();
        }
      default:
        return UnknownFailure.general();
    }
  }

  AppFailure _mapEditProfileError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure.connectionTimeout();
      case DioExceptionType.connectionError:
        return NetworkFailure.noInternet();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case 400:
            return const ValidationFailure(
              message: 'Profile validation failed',
              userFriendlyMessage: 'Please check your information and try again.',
              statusCode: 400,
              errorCode: 'PROFILE_VALIDATION',
            );
          case 401:
            return AuthenticationFailure.tokenExpired();
          case 500:
            return ServerFailure.internalError();
          default:
            return UnknownFailure.general();
        }
      default:
        return UnknownFailure.general();
    }
  }

  AppFailure _mapChangePasswordError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure.connectionTimeout();
      case DioExceptionType.connectionError:
        return NetworkFailure.noInternet();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case 400:
            return const ValidationFailure(
              message: 'Password change validation failed',
              userFriendlyMessage: 'New password doesn\'t meet requirements.',
              statusCode: 400,
              errorCode: 'PASSWORD_VALIDATION',
            );
          case 401:
            return const AuthenticationFailure(
              message: 'Current password incorrect',
              userFriendlyMessage: 'Current password is incorrect. Please try again.',
              statusCode: 401,
              errorCode: 'INCORRECT_PASSWORD',
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