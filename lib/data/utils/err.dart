import 'package:dio/dio.dart';

///Custom Error class for handling API errors
class Err implements Exception {
  final Response? res;
  final ErrorType type;
  final Object? exception;

  Err({
    this.type = ErrorType.unknown,
    this.res,
    this.exception,
  });

  @override
  String toString() {
    return "$type ${res?.statusCode} ${res?.data} $exception";
  }

}

enum ErrorType {
  apiError,
  modelCast,
  connection,
  badResponse,
  unknown,
}
