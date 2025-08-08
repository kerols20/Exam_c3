// // Create: lib/core/errors/handlers/error_handler.dart
// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:project_one_c3_team/core/errors/failures/server_failures.dart';
// import 'package:project_one_c3_team/core/errors/result/results.dart';
// import 'package:project_one_c3_team/core/errors/utils/endpoit_error_mapper.dart';



// @injectable
// class ErrorHandler {
//   Result<T> handleError<T>(Exception error, {String? endpoint}) {
//     if (error is DioException) {
//       final failure = EndpointErrorMapper.mapError(error, endpoint ?? 'unknown');
//       return Failure(failure);
//     }
    
//     return const Failure(UnknownFailure(
//       message: 'An unexpected error occurred',
//       userFriendlyMessage: 'Something went wrong. Please try again.',
//       errorCode: 'UNEXPECTED_ERROR',
//     ));
//   }

//   // Helper method for handling async operations
//   Future<Result<T>> handleAsyncOperation<T>(
//     Future<T> Function() operation, {
//     String? endpoint,
//   }) async {
//     try {
//       final result = await operation();
//       return Success(result);
//     } catch (e) {
//       if (e is Exception) {
//         return handleError(e, endpoint: endpoint);
//       }
//       return const Failure(UnknownFailure(
//         message: 'An unexpected error occurred',
//         userFriendlyMessage: 'Something went wrong. Please try again.',
//         errorCode: 'UNEXPECTED_ERROR',
//       ));
//     }
//   }
// }