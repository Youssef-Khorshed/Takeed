import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/components/FlightTicketRow/flightTicketRow.dart';
import 'package:takeed/components/text_box/text_box.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
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
            Container(
              height: 1.h,
              width: double.infinity,
              color: ColorManager.GrayColor2,
            ),
            SizedBox(height: 16.h),
            Flightticketrow(),
            Row(
              children: [
                Container(
                  width: 97.w,
                  child: Text('Indira Gandhi\nInternational Airport',
                      textAlign: TextAlign.center,
                      style: TextStyles.font12RegularDarkGray),
                ),
                Spacer(),
                Container(
                  width: 97.w,
                  child: Text('Subhash Chandra Bose\nInternational Airport',
                      textAlign: TextAlign.center,
                      style: TextStyles.font12RegularDarkGray),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Container(
              height: 1.h,
              width: double.infinity,
              color: ColorManager.GrayColor2,
            ),
            SizedBox(height: 6.h),
            Row(
              children: [
                Expanded(
                  child: MyTextBox(
                    prefixIcon: Icon(Icons.calendar_today),
                    readonly: false,
                    labelText: '15/07/2022',
                    hintText: 'hintText',
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: MyTextBox(
                    prefixIcon: Icon(Icons.timer_outlined),
                    readonly: false,
                    labelText: '09.30',
                    hintText: 'hintText',
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Container(
              height: 1.h,
              width: double.infinity,
              color: ColorManager.GrayColor2,
            ),
            SizedBox(height: 10),
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
