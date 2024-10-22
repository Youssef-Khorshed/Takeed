import 'package:flutter/material.dart';
import 'package:takeed/Features/BoardingPass/boardingPass.dart';
import 'package:takeed/Features/Payment/PaymentPage.dart';
import 'package:takeed/Features/home/Home/HomeScreen.dart';
import 'package:takeed/core/Routes/routes.dart';
import 'package:takeed/Features/Flight/FlightSearchResult/FlightSearchResultPage.dart';

class AppRoutes {
  Route generateroute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => Homescreen());
      case Routes.search:
        return MaterialPageRoute(
            builder: (context) => FlightSearchResultPage());

      case Routes.payment:
        return MaterialPageRoute(builder: (context) => PaymentScreen());

      case Routes.boardingPass:
        return MaterialPageRoute(builder: (context) => BoardingPass());

      default:
        return MaterialPageRoute(
            builder: (context) => const Text('data not found'));
    }
  }
}
