import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flight_offer_from_pricing/flight_offer_from_pricing.dart';
import 'package:takeed/Features/Flight/FlightSearchResult/FlightSearchResultCard.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

// ignore: must_be_immutable
class Airportdetails extends StatefulWidget {
  FlightOfferFromPricing flightSearchData;

  Airportdetails({super.key, required this.flightSearchData});

  @override
  State<Airportdetails> createState() => _AirportdetailsState();
}

class _AirportdetailsState extends State<Airportdetails> {
  @override
  void initState() {
    // widget.flightSearchData.itineraries ??= [
    //   Itineraries(duration: "PT1H30M", segments: [
    //     Segments(
    //       id: "1",
    //       numberOfStops: 0,
    //       blacklistedInEU: false,
    //       carrierCode: "AA",
    //       number: "1",
    //       duration: "PT1H30M",
    //       departure: Departure(
    //           iataCode: "JFK", terminal: "T2", at: "2022-07-26T22:30:00"),
    //       arrival: Departure(
    //           iataCode: "JFK", terminal: "T2", at: "2022-07-26T22:30:00"),
    //       aircraft: Aircraft(
    //         code: "320",
    //       ),
    //     )
    //   ])
    // ];

    super.initState();
  }

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
