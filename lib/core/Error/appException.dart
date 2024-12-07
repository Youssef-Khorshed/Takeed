import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class AppException implements Exception {
  final String message;
  final String? code;

  AppException(this.message, {this.code});
}

AppException handleException(Exception e) {
  if (e is SocketException) {
    return AppException('Network error: Please check your internet connection.',
        code: 'NETWORK_ERROR');
  } else if (e is HttpException) {
    return AppException('HTTP error: ${e.message}. Please verify the URL.',
        code: 'HTTP_ERROR');
  } else if (e is FormatException) {
    return AppException(
        'Format error: Invalid response format. Please contact support.',
        code: 'FORMAT_ERROR');
  } else if (e is TimeoutException) {
    return AppException('Request timed out: Please try again later.',
        code: 'TIMEOUT_ERROR');
  } else if (e is IOException) {
    return AppException('IO error: An unexpected input/output error occurred.',
        code: 'IO_ERROR');
  } else if (e is NoSuchMethodError) {
    return AppException(
        'Unexpected error: A method was called on a null object.',
        code: 'NULL_OBJECT_ERROR');
  } else {
    return AppException(
        'Unexpected error: ${e.toString()}. Please contact support.',
        code: 'UNKNOWN_ERROR');
  }
}

AppException handleStatuscode({required http.Response response}) {
  final errorResponse = json.decode(response.body) as Map<String, dynamic>;
  if (errorResponse['StatusCode'] != null) {
    return AppException(
      errorResponse['Message'] ?? 'Unexpected error occurred.',
      code: errorResponse['StatusCode'].toString(),
    );
  } else {
    switch (response.statusCode) {
      case 400:
        return AppException(
            'Bad Request: The server could not understand the request.',
            code: 'BAD_REQUEST');
      case 401:
        return AppException(
            'Unauthorized: Access is denied due to invalid credentials.',
            code: 'UNAUTHORIZED');
      case 403:
        return AppException(
            'Forbidden: You do not have permission to access this resource.',
            code: 'FORBIDDEN');
      case 404:
        return AppException(
            'Not Found: The requested resource could not be found.',
            code: 'NOT_FOUND');
      case 500:
        return AppException(
            'Internal Server Error: The server encountered an error.',
            code: 'SERVER_ERROR');
      default:
        return AppException('Unexpected error: ${response.statusCode}',
            code: 'UNKNOWN_STATUS');
    }
  }
}
