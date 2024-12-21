import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flight_offer_from_pricing/flight_offer_from_pricing.dart';
import 'package:takeed/components/Flight/airportDetails.dart';
import 'package:takeed/components/Flight/flightDateTime.dart';
import 'package:takeed/components/Flight/flightTicketRowForPricing.dart';
import 'package:takeed/components/Line/line.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

// ignore: must_be_immutable
class Flightdetailsbody extends StatelessWidget {
  FlightOfferFromPricing flightdetails;

  Flightdetailsbody({super.key, required this.flightdetails});

  @override
  Widget build(BuildContext context) {
    return _filghtDetailsBody(context: context);
  }

  Widget _filghtDetailsBody({required BuildContext context}) => Container(
        width: 328.w,
        height: 417.h,
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 90.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tayer',
                    style: TextStyles.font32BlueBold,
                  )
                ],
              ),
            ),
            Line(upperpadding: 0, lowerpadding: 16),
            FlightticketrowFromPricing(
              flightdetails: flightdetails,
            ),
            Airportdetails(
              flightSearchData: flightdetails,
            ),
            Line(upperpadding: 6, lowerpadding: 6),
            const Flightdatetime(),
            Line(upperpadding: 6, lowerpadding: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Price',
                  style: TextStyles.font24BlackRegular,
                ),
                Text(' \$${flightdetails.price!.grandTotal}',
                    style: TextStyles.font32BlackBold),
              ],
            ),
          ],
        ),
      );
}
