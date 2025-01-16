// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BoardingPass/airprotDetialsForBoarding.dart';
import 'package:takeed/Features/BoardingPass/fligtTicketRowForBoarding.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/create_flight_order.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flight_offer_from_pricing/flight_offer_from_pricing.dart';
import 'package:takeed/components/Flight/airportDetails.dart';
import 'package:takeed/components/Line/line.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class Boardingbody extends StatelessWidget {
  final CreateFlightOrder offers;
  const Boardingbody({
    super.key,
    required this.offers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Passenger Info
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: ColorManager.primaryOrnage,
              child: Text('D', style: TextStyles.font14WhiteRegular),
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mr. John Doe",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("Passenger"),
              ],
            ),
            const Spacer(),
            Text('Tayer', style: TextStyles.font14DarkBlueRegular),
          ],
        ),
        SizedBox(height: 24.h),
        // Flight Details
        Line(upperpadding: 6, lowerpadding: 6),
        FlightticketrowForBoarding(
          flightdetails: offers,
        ),
        AirportdetailsForBoarding(
          flightSearchData: offers,
        ),
        // Flightdatetime(),
        const SizedBox(height: 24),
        // Flight Info
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _infoColumn("Flight", "IN 230"),
            _infoColumn("Gate", "22"),
            _infoColumn("Seat", "2B"),
            _infoColumn("Class", "Economy"),
          ],
        ),
      ],
    );
  }

  Widget _infoColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.grey),
        ),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
