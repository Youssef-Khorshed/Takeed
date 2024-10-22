import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/components/Flight/airportDetails.dart';
import 'package:takeed/components/Flight/flightDateTime.dart';
import 'package:takeed/components/Flight/flightTicketRow.dart';
import 'package:takeed/components/Line/line.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class Boardingbody extends StatelessWidget {
  const Boardingbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Passenger Info
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Text('D', style: TextStyles.font14WhiteRegular),
              backgroundColor: ColorManager.primaryOrnage,
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
                Text("Passenger"),
              ],
            ),
            Spacer(),
            Text('Indigo', style: TextStyles.font14DarkBlueRegular),
          ],
        ),
        SizedBox(height: 24.h),
        // Flight Details
        Line(upperpadding: 6, lowerpadding: 6),
        Flightticketrow(),
        Airportdetails(),
        Flightdatetime(),
        SizedBox(height: 24),
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
          style: TextStyle(color: Colors.grey),
        ),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
