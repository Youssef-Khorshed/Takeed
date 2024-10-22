import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/components/Flight/airportDetails.dart';
import 'package:takeed/components/Flight/flightDateTime.dart';
import 'package:takeed/components/Flight/flightTicketRow.dart';
import 'package:takeed/components/Line/line.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class Flightdetailsbody extends StatelessWidget {
  const Flightdetailsbody({super.key});

  @override
  Widget build(BuildContext context) {
    return _filghtDetailsBody();
  }

  Widget _filghtDetailsBody() => Container(
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
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 90.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Indiago',
                    style: TextStyles.font32BlueBold,
                  )
                ],
              ),
            ),
            Line(upperpadding: 0, lowerpadding: 16),
            Flightticketrow(),
            Airportdetails(),
            Line(upperpadding: 6, lowerpadding: 6),
            Flightdatetime(),
            Line(upperpadding: 6, lowerpadding: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Price',
                  style: TextStyles.font24BlackRegular,
                ),
                Text(' \$230', style: TextStyles.font32BlackBold),
              ],
            ),
          ],
        ),
      );
}
