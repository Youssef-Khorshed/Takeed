import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/DataSource/flightremote.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/RepoImplementation/repoimplementation.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/Logic/cubit/flight_cubit.dart';
import 'package:takeed/core/DIOFactory/dioFactory.dart';
import 'package:get_it/get_it.dart';
import 'package:takeed/core/NetworkInfo/networkInfo.dart';
import 'package:takeed/core/blocObserver.dart';

final getit = GetIt.instance;

Future<void> getInit() async {
  // dio
  Dio dio = DioFactory.getDio();

  getit.registerLazySingleton<Dio>(() => dio);
// flight
  getit.registerFactory<FlightsRemote>(
      () => FlightsRemoteImplementation(dio: dio));
  getit.registerFactory(
      () => FlightsRepositoryImplementation(flightsRemote: getit()));
  getit.registerFactory<NetworkInfo>(() => NetworkInfoImpl(getit()));
  getit.registerFactory<FlightCubit>(() => FlightCubit(
        flightsRepositoryImplementation: getit(),
      ));
}

Future<void> intialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const SimpleBlocObserver();
  Future.wait([
    ScreenUtil.ensureScreenSize(),
    getInit(),
  ]);
}
