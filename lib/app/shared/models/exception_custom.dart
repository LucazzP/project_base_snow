import 'package:dio/dio.dart';

class AppException implements Exception {
  final String message;
  final int statusCode;
  final DioError dioError;

  AppException(
      {this.message = 'No message was provided',
      this.statusCode,
      this.dioError});

  @override
  String toString() =>
      'AppException(message: $message, statusCode: $statusCode)';
}
