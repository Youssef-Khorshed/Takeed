import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:takeed/core/DI/dependencyInjection.dart';
import 'package:takeed/core/Enums/localization.dart';
import 'package:takeed/core/Error/failure.dart';
import 'package:takeed/core/Error/internet.dart';
import 'package:takeed/core/NetworkInfo/logger.dart';
import 'package:takeed/core/lang/LocalCubit/local_cubit.dart';
import 'package:takeed/core/utils/secure_token.dart';

class HttpFactory {
  final InternetConnectivity internetConnectivity;
  static http.Client? _client;
  final Duration timeOut = const Duration(seconds: 30);

  HttpFactory({required this.internetConnectivity}) {
    _client ??= http.Client();
  }

  Future<Map<String, String>> _getHeaders({
    String? outerToken,
    String? contentType,
    Map<String, dynamic>? headers,
  }) async {
    final token = await SecureToken.getToken();
    final language = getit.get<LocalCubit>().localizationThemeState ==
            LocalizationThemeState.ar
        ? "ar"
        : "en";

    return headers?.cast<String, String>() ??
        {
          'Accept': 'application/json',
          'Content-Type': contentType ?? 'application/json',
          'Authorization': 'Bearer ${token ?? outerToken}',
          'X-Locale': language,
        };
  }

  Future<Either<String, http.Response>> getRequest({
    required String url,
    Object? body,
    String? contentType,
    String? outerToken,
    Map<String, dynamic>? headers,
  }) async {
    try {
      if (await internetConnectivity.isConnected) {
        final requestHeaders = await _getHeaders(
          outerToken: outerToken,
          contentType: contentType,
          headers: headers,
        );

        Logger.logRequest(
          method: 'GET',
          url: url,
          headers: requestHeaders,
          body: body,
        );

        final stopwatch = Stopwatch()..start();
        final response = await http
            .get(
              Uri.parse(url),
              headers: requestHeaders,
            )
            .timeout(timeOut);
        stopwatch.stop();

        Logger.logResponse(
          statusCode: response.statusCode,
          body: response.body,
          duration: stopwatch.elapsed,
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(response);
        } else {
          return Left(_handleErrorResponse(response));
        }
      }
      return const Left('No internet Connection');
    } catch (e) {
      Logger.logError(e);
      return Left(_handleException(e));
    }
  }

  Future<Either<String, http.Response>> postRequest({
    required String url,
    Object? body,
    String? contentType,
    String? outerToken,
    Map<String, dynamic>? headers,
  }) async {
    try {
      if (await internetConnectivity.isConnected) {
        final requestHeaders = await _getHeaders(
          outerToken: outerToken,
          contentType: contentType,
          headers: headers,
        );

        final encodedBody = body != null ? json.encode(body) : null;
        Logger.logRequest(
          method: 'POST',
          url: url,
          headers: requestHeaders,
          body: encodedBody,
        );

        final stopwatch = Stopwatch()..start();
        final response = await http
            .post(
              Uri.parse(url),
              body: encodedBody,
              headers: requestHeaders,
            )
            .timeout(timeOut);
        stopwatch.stop();

        Logger.logResponse(
          statusCode: response.statusCode,
          body: response.body,
          duration: stopwatch.elapsed,
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(response);
        } else {
          return Left(ServerFailure.fromResponse(response));
        }
      }
      return const Left('No internet Connection');
    } catch (e) {
      Logger.logError(e);
      return Left(_handleException(e));
    }
  }

  Future<Either<String, http.Response>> putRequest({
    required String url,
    Object? body,
    String? contentType,
    String? outerToken,
    Map<String, dynamic>? headers,
  }) async {
    try {
      if (await internetConnectivity.isConnected) {
        final requestHeaders = await _getHeaders(
          outerToken: outerToken,
          contentType: contentType,
          headers: headers,
        );

        final encodedBody = body != null ? json.encode(body) : null;
        Logger.logRequest(
          method: 'PUT',
          url: url,
          headers: requestHeaders,
          body: encodedBody,
        );

        final stopwatch = Stopwatch()..start();
        final response = await http
            .put(
              Uri.parse(url),
              body: encodedBody,
              headers: requestHeaders,
            )
            .timeout(timeOut);
        stopwatch.stop();

        Logger.logResponse(
          statusCode: response.statusCode,
          body: response.body,
          duration: stopwatch.elapsed,
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(response);
        } else {
          return Left(ServerFailure.fromResponse(response));
        }
      }
      return const Left('No internet Connection');
    } catch (e) {
      Logger.logError(e);
      return Left(_handleException(e));
    }
  }

  Future<Either<String, http.Response>> deleteRequest({
    required String url,
    Object? body,
    String? contentType,
    String? outerToken,
    Map<String, dynamic>? headers,
  }) async {
    try {
      if (await internetConnectivity.isConnected) {
        final requestHeaders = await _getHeaders(
          outerToken: outerToken,
          contentType: contentType,
          headers: headers,
        );

        final encodedBody = body != null ? json.encode(body) : null;
        Logger.logRequest(
          method: 'DELETE',
          url: url,
          headers: requestHeaders,
          body: encodedBody,
        );

        final stopwatch = Stopwatch()..start();
        final response = await http
            .delete(
              Uri.parse(url),
              body: encodedBody,
              headers: requestHeaders,
            )
            .timeout(timeOut);
        stopwatch.stop();

        Logger.logResponse(
          statusCode: response.statusCode,
          body: response.body,
          duration: stopwatch.elapsed,
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(response);
        } else {
          return Left(ServerFailure.fromResponse(response));
        }
      }
      return const Left('No internet Connection');
    } catch (e) {
      Logger.logError(e);
      return Left(_handleException(e));
    }
  }

  String _handleErrorResponse(http.Response response) {
    try {
      final body = json.decode(response.body);
      return body['message'] ?? 'Server Error';
    } catch (e) {
      return 'Server Error';
    }
  }

  String _handleException(dynamic error) {
    if (error is TimeoutException) {
      return 'Connection timeout';
    }
    return 'Unexpected error occurred';
  }
}
