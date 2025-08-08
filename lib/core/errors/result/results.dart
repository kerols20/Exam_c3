// Create: lib/core/errors/result/result.dart
import 'package:project_one_c3_team/core/errors/failures/app_failure.dart';

sealed class Result<T> {
  const Result();
}

final class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

final class Failure<T> extends Result<T> {
  final AppFailure failure;
  const Failure(this.failure);
}

extension ResultExtension<T> on Result<T> {
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;
  
  T? get data => this is Success<T> ? (this as Success<T>).data : null;
  AppFailure? get failure => this is Failure<T> ? (this as Failure<T>).failure : null;
  
  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(AppFailure failure) onFailure,
  }) {
    return switch (this) {
      Success(data: final data) => onSuccess(data),
      Failure(failure: final failure) => onFailure(failure),
    };
  }
}