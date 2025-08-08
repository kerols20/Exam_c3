// // Create: lib/core/errors/handlers/endpoint_error_mapper.dart
// import 'package:dio/dio.dart';
// import '../failures/app_failure.dart';
// import '../failures/auth_failures.dart';
// import '../failures/validation_failures.dart';
// import '../failures/server_failures.dart';
// import '../failures/network_failures.dart';

// class EndpointErrorMapper {
//   static AppFailure mapError(DioException error, String endpoint) {
//     switch (error.type) {
//       case DioExceptionType.connectionTimeout:
//         return NetworkFailure.connectionTimeout();
//       case DioExceptionType.sendTimeout:
//         return TimeoutFailure.sendTimeout();
//       case DioExceptionType.receiveTimeout:
//         return TimeoutFailure.receiveTimeout();
//       case DioExceptionType.connectionError:
//         return NetworkFailure.connectionError();
//       case DioExceptionType.badResponse:
//         return _mapBadResponse(error, endpoint);
//       case DioExceptionType.cancel:
//         return const NetworkFailure(
//           message: 'Request cancelled',
//           userFriendlyMessage: 'Request was cancelled.',
//           errorCode: 'REQUEST_CANCELLED',
//         );
//       case DioExceptionType.badCertificate:
//         return const NetworkFailure(
//           message: 'Bad certificate',
//           userFriendlyMessage: 'Security certificate error. Please try again.',
//           errorCode: 'BAD_CERTIFICATE',
//         );
//       case DioExceptionType.unknown:
//         if (error.message?.contains('SocketException') == true) {
//           return NetworkFailure.noInternet();
//         }
//         return UnknownFailure.general();
//     }
//   }

//   static AppFailure _mapBadResponse(DioException error, String endpoint) {
//     final statusCode = error.response?.statusCode;
//     final responseData = error.response?.data;

//     switch (statusCode) {
//       case 400:
//         return _map400Error(responseData, endpoint);
//       case 401:
//         return _map401Error(responseData, endpoint);
//       case 403:
//         return AuthorizationFailure.accessDenied();
//       case 404:
//         return _map404Error(responseData, endpoint);
//       case 422:
//         return _map422Error(responseData, endpoint);
//       case 500:
//         return ServerFailure.internalError();
//       case 502:
//         return ServerFailure.badGateway();
//       case 503:
//         return ServerFailure.serviceUnavailable();
//       default:
//         return UnknownFailure.general();
//     }
//   }

//   static AppFailure _map400Error(dynamic responseData, String endpoint) {
//     final message = _extractMessage(responseData);
    
//     switch (endpoint) {
//       case 'signUp':
//         return ValidationFailure(
//           message: 'Sign up validation failed: $message',
//           userFriendlyMessage: 'Please check your information. Some fields may be invalid or already exist.',
//           statusCode: 400,
//           errorCode: 'SIGNUP_VALIDATION',
//           fieldErrors: _extractFieldErrors(responseData),
//         );
//       case 'signIn':
//         return AuthenticationFailure.invalidCredentials();
//       case 'changePassword':
//         return ValidationFailure(
//           message: 'Password change validation failed: $message',
//           userFriendlyMessage: 'Current password is incorrect or new password doesn\'t meet requirements.',
//           statusCode: 400,
//           errorCode: 'PASSWORD_CHANGE_VALIDATION',
//         );
//       case 'editProfile':
//         return ValidationFailure.formValidation(
//           fieldErrors: _extractFieldErrors(responseData) ?? {},
//           context: 'editProfile',
//         );
//       case 'forgotPassword':
//         return ValidationFailure(
//           message: 'Forgot password validation failed: $message',
//           userFriendlyMessage: 'Please check your email address and try again.',
//           statusCode: 400,
//           errorCode: 'FORGOT_PASSWORD_VALIDATION',
//         );
//       case 'verifyResetCode':
//         return ValidationFailure(
//           message: 'Verification code validation failed: $message',
//           userFriendlyMessage: 'Invalid or expired verification code. Please try again.',
//           statusCode: 400,
//           errorCode: 'VERIFY_CODE_VALIDATION',
//         );
//       case 'resetPassword':
//         return ValidationFailure(
//           message: 'Reset password validation failed: $message',
//           userFriendlyMessage: 'Invalid reset code or password doesn\'t meet requirements.',
//           statusCode: 400,
//           errorCode: 'RESET_PASSWORD_VALIDATION',
//         );
//       default:
//         return ValidationFailure.formValidation(
//           fieldErrors: _extractFieldErrors(responseData) ?? {},
//           context: endpoint,
//         );
//     }
//   }

//   static AppFailure _map401Error(dynamic responseData, String endpoint) {
//     final message = _extractMessage(responseData);
    
//     switch (endpoint) {
//       case 'signIn':
//         return AuthenticationFailure.invalidCredentials();
//       case 'changePassword':
//         return AuthenticationFailure(
//           message: 'Current password is incorrect: $message',
//           userFriendlyMessage: 'Current password is incorrect. Please try again.',
//           statusCode: 401,
//           errorCode: 'INCORRECT_CURRENT_PASSWORD',
//         );
//       default:
//         return AuthenticationFailure.tokenExpired();
//     }
//   }

//   static AppFailure _map404Error(dynamic responseData, String endpoint) {
//     switch (endpoint) {
//       case 'getSubjects':
//         return DataFailure.notFound(resource: 'subjects');
//       case 'getExams':
//         return DataFailure.notFound(resource: 'exams');
//       case 'getQuestions':
//         return DataFailure.notFound(resource: 'questions');
//       case 'getUserInfo':
//         return DataFailure.notFound(resource: 'user information');
//       default:
//         return DataFailure.notFound();
//     }
//   }

//   static AppFailure _map422Error(dynamic responseData, String endpoint) {
//     return ValidationFailure.formValidation(
//       fieldErrors: _extractFieldErrors(responseData) ?? {},
//       context: endpoint,
//     );
//   }

//   static String _extractMessage(dynamic responseData) {
//     if (responseData is Map<String, dynamic>) {
//       return responseData['message']?.toString() ?? 
//              responseData['error']?.toString() ?? 
//              responseData['msg']?.toString() ?? 
//              'Unknown error';
//     }
//     return responseData?.toString() ?? 'Unknown error';
//   }

//   static Map<String, List<String>>? _extractFieldErrors(dynamic responseData) {
//     if (responseData is Map<String, dynamic>) {
//       final errors = responseData['errors'] ?? responseData['validationErrors'];
//       if (errors is Map<String, dynamic>) {
//         return errors.map((key, value) => MapEntry(
//           key,
//           value is List ? value.cast<String>() : [value.toString()],
//         ));
//       }
//     }
//     return null;
//   }
// }