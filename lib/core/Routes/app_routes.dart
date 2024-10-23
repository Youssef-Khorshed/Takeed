import 'package:flutter/material.dart';
import 'package:takeed/Features/BoardingPass/boardingPass.dart';
import 'package:takeed/Features/Payment/PaymentPage.dart';
import 'package:takeed/Features/home/Home/HomeScreen.dart';
import 'package:takeed/Features/home/Home/Logic/Cubit/cubit/cubit_example_cubit.dart';
import 'package:takeed/Features/home/Home/bottomNaigation.dart';
import 'package:takeed/Features/home/MyBooking/mybooking.dart';
import 'package:takeed/Features/home/MyBooking/mybookingDetails.dart';
import 'package:takeed/Features/home/Offers/offers.dart';
import 'package:takeed/Features/home/Profile/profile.dart';
import 'package:takeed/core/Routes/routes.dart';
import 'package:takeed/Features/Flight/FlightSearchResult/FlightSearchResultPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  Route generateroute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => Homescreen(),
        );
      case Routes.search:
        return MaterialPageRoute(
            builder: (context) => FlightSearchResultPage());

      case Routes.payment:
        return MaterialPageRoute(builder: (context) => PaymentScreen());

      case Routes.boardingPass:
        return MaterialPageRoute(builder: (context) => BoardingPass());

      case Routes.mybooking:
        return MaterialPageRoute(builder: (context) => const Mybooking());

      case Routes.profile:
        return MaterialPageRoute(builder: (context) => ProfilePage());

      case Routes.offers:
        return MaterialPageRoute(builder: (context) => OffersPage());

      case Routes.mybooking:
        return MaterialPageRoute(builder: (context) => const Mybooking());

      case Routes.mybookingdetails:
        return MaterialPageRoute(
            builder: (context) => const Mybookingdetails());

      case Routes.bottomnavigation:
        return MaterialPageRoute(
          builder: (context) => HomeScreenButtomNavigation(),
        );

      default:
        return MaterialPageRoute(
            builder: (context) => const Text('data not found'));
    }
  }
}
