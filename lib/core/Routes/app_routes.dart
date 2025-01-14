import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takeed/Features/Auth/Logic/LoginCubit/logincubit.dart';
import 'package:takeed/Features/Auth/Login/LoginScreen.dart';
import 'package:takeed/Features/Auth/Login/otp.dart';
import 'package:takeed/Features/Auth/Signup/signupScreen.dart';
import 'package:takeed/Features/BoardingPass/boardingPass.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/create_flight_order.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/flight_offer.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/price.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/Logic/cubit/flight_cubit.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/UI/HomeScreen.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/UI/widgets/bottomNaigation.dart';
import 'package:takeed/Features/BottomNavigation/MyBooking/mybookingDetails.dart';
import 'package:takeed/Features/BottomNavigation/Offers/offers.dart';
import 'package:takeed/Features/BottomNavigation/Profile/profile.dart';
import 'package:takeed/Features/Payment/PaymentPage.dart';
import 'package:takeed/core/DI/dependencyInjection.dart';
import 'package:takeed/core/Routes/routes.dart';
import 'package:takeed/Features/Flight/FlightSearchResult/FlightSearchResultPage.dart';

class AppRoutes {
  Route generateroute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getit<FlightCubit>(),
            child: Homescreen(),
          ),
        );
      case Routes.search:
        return MaterialPageRoute(
            builder: (context) => const FlightSearchResultPage());

      // case Routes.payment:
      //   return MaterialPageRoute(
      //       builder: (context) => PaymentScreen(
      //             flightdetails: GetFlightOffers(),
      //           ));

      case Routes.boardingPass:
        return MaterialPageRoute(builder: (context) => const BoardingPass());
      case Routes.otp:
        return MaterialPageRoute(builder: (context) => const OtpScreen());

      // case Routes.mybooking:
      //   return MaterialPageRoute(
      //       builder: (context) => Mybooking(
      //             flightdetails: GetFlightOffers(),
      //           ));

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

      case Routes.payment:
        return MaterialPageRoute(
            builder: (context) => PaymentScreen(
                  flightdetails: CreateFlightOrder(flightOffers: [
                    FlightOffer(
                      price: Price(
                        total: '300',
                        grandTotal: '300',
                        base: '300',
                        tayarrFees: '0',
                        tayarrTaxes: '0',
                        fees: [],
                      ),
                    )
                  ]),
                ));

      case Routes.offers:
        return MaterialPageRoute(builder: (context) => OffersPage());

      case Routes.mybookingdetails:
        return MaterialPageRoute(
            builder: (context) => const Mybookingdetails());

      case Routes.bottomnavigation:
        return MaterialPageRoute(
          builder: (context) => BlocBuilder<FlightCubit, FlightState>(
            builder: (context, state) {
              return const HomeScreenButtomNavigation();
            },
          ),
        );

      default:
        return MaterialPageRoute(
            builder: (context) => const Text('data not found'));
    }
  }
}
