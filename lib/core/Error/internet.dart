import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:takeed/core/Error/appException.dart';
import 'package:takeed/core/Error/either.dart';

abstract class ConnectivityService {
  Future<FetchResult<bool, AppException>> isConnectedToInternet();
}

class ConnectivityServiceImpl implements ConnectivityService {
  ConnectivityService connectivityService;
  ConnectivityServiceImpl({required this.connectivityService});
  @override
  Future<FetchResult<bool, AppException>> isConnectedToInternet() async {
    try {
      final bool result = await InternetConnectionChecker().hasConnection;

      if (result) {
        return FetchResult.success(true);
      } else {
        return FetchResult.error(AppException('Not connected to any network',
            code: 'NO_CONNECTION'));
      }
    } catch (e) {
      print('Error checking connectivity: $e');
      return FetchResult.error(AppException(
          'Error checking connectivity: ${e.toString()}',
          code: 'CHECK_ERROR'));
    }
  }
}
