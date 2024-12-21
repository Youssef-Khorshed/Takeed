import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flight_offer_from_pricing/flight_offer_from_pricing.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/Logic/cubit/flight_cubit.dart';
import 'package:takeed/Features/Flight/FlightDetails/flightDetailsBody.dart';
import 'package:takeed/Features/Flight/FlightDetails/flightDetailsFooter.dart';
import 'package:takeed/Features/Payment/PaymentPage.dart';
import 'package:takeed/core/Routes/routes.dart';

// ignore: must_be_immutable
class FlightDetailsPage extends StatelessWidget {
  FlightOfferFromPricing flightdetails;
  FlightDetailsPage({super.key, required this.flightdetails});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FlightCubit, FlightState>(
      listener: (context, state) {
        if (state is GetFlightOrderResult) {
          Navigator.of(context).pushReplacement(CupertinoPageRoute(
              builder: (_) => PaymentScreen(flightdetails: state.flight)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flight details'),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flightdetailsbody(
                  flightdetails: flightdetails,
                ),
                SizedBox(height: 30.h),
                Flightdetailsfooter(
                  flightSearchData: flightdetails,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
