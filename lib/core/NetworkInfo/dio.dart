import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:takeed/core/DI/dependencyInjection.dart';
import 'package:takeed/core/Enums/localization.dart';
import 'package:takeed/core/Error/failure.dart';
import 'package:takeed/core/Error/internet.dart';
import 'package:takeed/core/NetworkInfo/logger.dart';
import 'package:takeed/core/lang/LocalCubit/local_cubit.dart';
import 'package:takeed/core/utils/secure_token.dart';

class DioFactory {
  final InternetConnectivity internetConnectivity;
  static Dio? _dio;
  final Duration timeOut = const Duration(seconds: 30);

  DioFactory({required this.internetConnectivity});

  Future<Dio> getDio({
    String? outerToken,
    String? contentType,
    Map<String, dynamic>? headers,
  }) async {
    final token = await SecureToken.getToken();

    if (_dio == null) {
      _dio = Dio()
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      _addDioInterceptor();
    }

    final language = getit.get<LocalCubit>().localizationThemeState ==
            LocalizationThemeState.ar
        ? "ar"
        : "en";

    _addDioHeaders(
      language: language,
      token: token ?? outerToken,
      contentType: contentType,
      headers: headers,
    );

    return _dio!;
  }

  static void _addDioHeaders({
    String? token,
    String? language,
    String? contentType,
    Map<String, dynamic>? headers,
  }) {
    _dio?.options.contentType = contentType ?? 'application/json';
    _dio?.options.headers = headers ??
        {
          // 'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          //   if (language != null) 'X-Locale': language,
        };
  }

  void _addDioInterceptor() {
    _dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          Logger.logRequest(
            method: options.method,
            url: options.uri.toString(),
            headers: options.headers.cast<String, String>(),
            body: options.data,
          );
          return handler.next(options);
        },
        onResponse: (response, handler) {
          final requestTime =
              response.requestOptions.extra['requestTime'] as DateTime?;
          final duration = requestTime != null
              ? DateTime.now().difference(requestTime)
              : const Duration();

          Logger.logResponse(
            statusCode: response.statusCode ?? 0,
            body: response.data.toString(),
            duration: duration,
          );
          return handler.next(response);
        },
        onError: (error, handler) {
          Logger.logError(error);
          return handler.next(error);
        },
      ),
    );
  }

  Future<Either<String, Response>> getRequest({
    required String url,
    Object? body,
    String? contentType,
    String? outerToken,
    Map<String, dynamic>? headers,
  }) async {
    try {
      if (!await internetConnectivity.isConnected) {
        return const Left('No internet Connection');
      }

      final dio = await getDio(
        outerToken: outerToken,
        headers: headers,
        contentType: contentType,
      );

      final response = await dio.get(url, data: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response);
      } else {
        return Left(ServerFailure.fromResponse(response));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDio(e));
    } on TimeoutException {
      return const Left('Connection timeout');
    } catch (e) {
      return const Left('Unexpected error occurred');
    }
  }

  Future<Either<String, Response>> postRequest({
    required String url,
    Object? body,
    String? contentType,
    String? outerToken,
    Map<String, dynamic>? headers,
  }) async {
    try {
      if (!await internetConnectivity.isConnected) {
        return const Left('No internet Connection');
      }

      final dio = await getDio(
        outerToken: outerToken,
        headers: headers,
        contentType: contentType,
      );

      final response = await dio.post(url, data: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response);
      } else {
        return Left(ServerFailure.fromResponse(response));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDio(e));
    } on TimeoutException {
      return const Left('Connection timeout');
    } catch (e) {
      return const Left('Unexpected error occurred');
    }
  }

  Future<Either<String, Response>> putRequest({
    required String url,
    Object? body,
    String? contentType,
    String? outerToken,
    Map<String, dynamic>? headers,
  }) async {
    try {
      if (!await internetConnectivity.isConnected) {
        return const Left('No internet Connection');
      }

      final dio = await getDio(
        outerToken: outerToken,
        headers: headers,
        contentType: contentType,
      );

      final response = await dio.put(url, data: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response);
      } else {
        return Left(ServerFailure.fromResponse(response));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDio(e));
    } on TimeoutException {
      return const Left('Connection timeout');
    } catch (e) {
      return const Left('Unexpected error occurred');
    }
  }

  Future<Either<String, Response>> deleteRequest({
    required String url,
    Object? body,
    String? contentType,
    String? outerToken,
    Map<String, dynamic>? headers,
  }) async {
    try {
      if (!await internetConnectivity.isConnected) {
        return const Left('No internet Connection');
      }

      final dio = await getDio(
        outerToken: outerToken,
        headers: headers,
        contentType: contentType,
      );

      final response = await dio.delete(url, data: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response);
      } else {
        return Left(ServerFailure.fromResponse(response));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDio(e));
    } on TimeoutException {
      return const Left('Connection timeout');
    } catch (e) {
      return const Left('Unexpected error occurred');
    }
  }
}
