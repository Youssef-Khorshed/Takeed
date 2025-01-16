import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class Failure {
  final String message;
  Failure({required this.message});

  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  static String fromResponse(http.Response response) {
    final data = json.decode(response.body);
    if (data is String) {
      return data;
    } else if (data is Map) {
      return data['Message'] ??
          data['title'] ??
          data['errors'] ??
          'Unknown error';
    } else {
      switch (response.statusCode) {
        case 200 || 201:
          return "Success! Data fetched.";
        case 400:
          return "Bad Request: Please check your parameters.";
        case 401:
          return "Unauthorized: Check your API key.";
        case 403:
          return "Forbidden: You don't have access to this resource.";
        case 404:
          return "Not Found: The requested resource could not be found.";
        case 408:
          return "Request Timeout: The server took too long to respond.";
        case 422:
          return "Unprocessable Entity: The request was well-formed but unable to be followed due to semantic errors.";
        case 500:
          return "Server Error: Something went wrong on the server.";
        case 503:
          return "Service Unavailable: The service is temporarily down.";
        default:
          return "Unexpected error: ${response.statusCode}. Please try again later.";
      }
    }
  }
}

/// Local Error
class LocalFailure extends Failure {
  LocalFailure({required super.message});
}

/// connection Error
class InternetConnectionFailure extends Failure {
  InternetConnectionFailure({required super.message});
}

/// Unexpected Error
class UnExpectedFailure extends Failure {
  UnExpectedFailure({required super.message});
}
