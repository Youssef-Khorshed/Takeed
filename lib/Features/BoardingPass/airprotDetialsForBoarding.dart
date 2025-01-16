import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/create_flight_order.dart';
import 'package:takeed/Features/Flight/FlightSearchResult/FlightSearchResultCard.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

// ignore: must_be_immutable
class AirportdetailsForBoarding extends StatefulWidget {
  CreateFlightOrder flightSearchData;

  AirportdetailsForBoarding({super.key, required this.flightSearchData});

  @override
  State<AirportdetailsForBoarding> createState() =>
      _AirportdetailsForBoardingState();
}

class _AirportdetailsForBoardingState extends State<AirportdetailsForBoarding> {
  @override
  Widget build(BuildContext context) {
    return widget.flightSearchData.flightOffers!.first.itineraries == null
        ? const Center(
            child: Text('No Bookings'),
          )
        : Row(
            children: [
              SizedBox(
                width: 97.w,
                child: Text(
                    FlightCard.getDate(
                        time: widget.flightSearchData.flightOffers!.first
                            .itineraries![0].segments![0].departure!.at!),
                    textAlign: TextAlign.center,
                    style: TextStyles.font12RegularDarkGray),
              ),
              const Spacer(),
              SizedBox(
                width: 97.w,
                child: Text(
                    FlightCard.getDate(
                        time: widget.flightSearchData.flightOffers!.first
                            .itineraries![0].segments![0].arrival!.at!),
                    textAlign: TextAlign.center,
                    style: TextStyles.font12RegularDarkGray),
              ),
            ],
          );
  }
}
