import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takeed/Features/Auth/Logic/LoginCubit/logincubit.dart';
import 'package:takeed/Features/Auth/Login/LoginScreen.dart';
import 'package:takeed/Features/Auth/Login/otp.dart';
import 'package:takeed/Features/Auth/Signup/signupScreen.dart';
import 'package:takeed/Features/BoardingPass/boardingPass.dart';
import 'package:takeed/Features/Payment/PaymentPage.dart';
import 'package:takeed/Features/home/Home/HomeScreen.dart';
import 'package:takeed/Features/home/Home/bottomNaigation.dart';
import 'package:takeed/Features/home/MyBooking/mybooking.dart';
import 'package:takeed/Features/home/MyBooking/mybookingDetails.dart';
import 'package:takeed/Features/home/Offers/offers.dart';
import 'package:takeed/Features/home/Profile/profile.dart';
import 'package:takeed/core/Routes/routes.dart';
import 'package:takeed/Features/Flight/FlightSearchResult/FlightSearchResultPage.dart';

class AppRoutes {
  Route generateroute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => Homescreen(),
        );
      case Routes.search:
        return MaterialPageRoute(
            builder: (context) => const FlightSearchResultPage());

      case Routes.payment:
        return MaterialPageRoute(builder: (context) => const PaymentScreen());

      case Routes.boardingPass:
        return MaterialPageRoute(builder: (context) => const BoardingPass());
      case Routes.otp:
        return MaterialPageRoute(builder: (context) => OtpScreen());

      case Routes.mybooking:
        return MaterialPageRoute(builder: (context) => const Mybooking());

      case Routes.profile:
        return MaterialPageRoute(builder: (context) => ProfilePage());

      case Routes.login:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => Logincubit(),
                  child: const Loginscreen(),
                ));

      case Routes.register:
        return MaterialPageRoute(builder: (context) => const Signupscrenn());

      case Routes.offers:
        return MaterialPageRoute(builder: (context) => OffersPage());

      case Routes.mybookingdetails:
        return MaterialPageRoute(
            builder: (context) => const Mybookingdetails());

      case Routes.bottomnavigation:
        return MaterialPageRoute(
          builder: (context) => const HomeScreenButtomNavigation(),
        );

      default:
        return MaterialPageRoute(
            builder: (context) => const Text('data not found'));
    }
  }
}
