import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flight_offer_from_pricing/flight_offer_from_pricing.dart';
import 'package:takeed/Features/Flight/FlightSearchResult/FlightSearchResultCard.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

// ignore: must_be_immutable
class FlightticketrowFromPricing extends StatefulWidget {
  FlightOfferFromPricing flightdetails;

  FlightticketrowFromPricing({super.key, required this.flightdetails});

  @override
  State<FlightticketrowFromPricing> createState() =>
      _FlightticketrowFromPricingState();
}

class _FlightticketrowFromPricingState
    extends State<FlightticketrowFromPricing> {
  @override
  Widget build(BuildContext context) {
    return widget.flightdetails.flightOffers!.first.itineraries == null
        ? const Center(
            child: Text('No Bookings'),
          )
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          FlightCard.getTime(
                              time: widget
                                  .flightdetails
                                  .flightOffers!
                                  .first
                                  .itineraries!
                                  .first
                                  .segments!
                                  .first
                                  .departure!
                                  .at!),
                          style: TextStyles.font18BlackBold),
                      Text(
                          widget.flightdetails.flightOffers!.first.itineraries!
                              .first.segments!.first.departure!.iataCode!,
                          style: TextStyles.font14BlackRegular),
                    ],
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  CircleAvatar(
                    radius: 4.r,
                    backgroundColor: ColorManager.GrayColor,
                  ),
                  Container(
                    width: 40.w,
                    height: 2.h,
                    color: ColorManager.GrayColor,
                  ),
                  const CircleAvatar(
                      backgroundColor: ColorManager.primaryOrnage,
                      child:
                          Icon(Icons.airplanemode_active, color: Colors.white)),
                  Container(
                    width: 40.w,
                    height: 2.h,
                    color: ColorManager.GrayColor,
                  ),
                  CircleAvatar(
                    radius: 4.r,
                    backgroundColor: ColorManager.GrayColor,
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          FlightCard.getTime(
                              time: widget
                                  .flightdetails
                                  .flightOffers!
                                  .first
                                  .itineraries!
                                  .first
                                  .segments!
                                  .first
                                  .arrival!
                                  .at!),
                          style: TextStyles.font18BlackBold),
                      Text(
                          widget.flightdetails.flightOffers!.first.itineraries!
                              .first.segments!.first.arrival!.iataCode!,
                          style: TextStyles.font14BlackRegular),
                    ],
                  ),
                ],
              ),
            ],
          );
  }
}
