import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    // final source = await SharedPrefHelper.getSecuredString('ACCESS_TOKEN');
    // final json = jsonDecode(source);
    // userData = UserData.fromJson(json);
    dio?.options.headers = {
      'Accept': 'application/json',
      //   'Authorization': 'Bearer ${userData!.token ?? ''}',
    };
  }

  // static void setUserData(UserData userData) async {
  //   await SharedPrefHelper.setSecuredString(
  //       'ACCESS_TOKEN', jsonEncode(userData.toJson()));
  //   dio?.options.headers = {
  //     'Authorization': 'Bearer ${userData.token}',
  //   };
  // }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
