import 'package:flutter/material.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/search/flight_search_screen.dart';
class AppRoutes {
  static const String home = '/screens/home/home_screen';
  static const String splash = '/screens/splash/splash_screen';
  static const String flightSearch = '/screens/search/flight_search _screen';
  ///
  /// Map all routes in one object
  static Map<String, WidgetBuilder> allRoutes = {
    AppRoutes.splash: (_) => SplashScreen(),
    AppRoutes.home: (_) => HomeScreen(),
    AppRoutes.flightSearch: (_) => FlightSearchScreen(),
  };
}