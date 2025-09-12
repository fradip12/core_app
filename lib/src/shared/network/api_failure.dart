import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({
    required this.message,
  });
  final String message;

  @override
  List<Object?> get props => <Object?>[];
}

class RequestFailure extends Failure {
  const RequestFailure([String? message]) : super(message: message ?? '');
}

class ServerFailure extends Failure {
  const ServerFailure([String? message]) : super(message: message ?? '');
}

class NetworkFailure extends Failure {
  const NetworkFailure([String? message]) : super(message: message ?? '');
}

class ApiFailure extends Failure {
  const ApiFailure([
    String? message,
  ]) : super(message: message ?? '');
}

Failure handleFailure(DioException e) {
  if (e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.connectionError) {
    return const NetworkFailure();
  } else if (e.type == DioExceptionType.unknown) {
    return const ServerFailure();
  } else if (e.type == DioExceptionType.badResponse) {
    return const ServerFailure();
  } else if (e.type == DioExceptionType.cancel) {
    return const NetworkFailure();
  }

  return const ServerFailure();
}
