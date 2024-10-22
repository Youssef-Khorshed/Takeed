import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/components/Flight/flightTicketRow.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class Paymentbody extends StatelessWidget {
  const Paymentbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10.h),
          color: ColorManager.GrayMediumColor,
          width: 360.w,
          height: 203.h,
          child: Column(
            children: [
              Row(
                children: [
                  Text('Indigo', style: TextStyles.font14DarkBlueRegular),
                  Spacer(),
                  Icon(Icons.calendar_month_outlined),
                  SizedBox(width: 10.w),
                  Text(
                    '15/7/2022',
                    style: TextStyles.font14BlackRegular,
                  )
                ],
              ),
              SizedBox(height: 30.h),
              Flightticketrow(),
              SizedBox(height: 25.h),
              Row(
                children: [
                  Text(
                    'Total',
                    style: TextStyles.font14BlackRegular,
                  ),
                  Spacer(),
                  Text(
                    '\$ 230',
                    style: TextStyles.font22orangeBold,
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Card number',
              style: TextStyles.font16BlackRegular,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '0000 0000 0000 0000',
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Card holder name',
              style: TextStyles.font16BlackRegular,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'John Doe',
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CVV',
                    style: TextStyles.font16BlackRegular,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '000',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expiry date',
                    style: TextStyles.font16BlackRegular,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '9/26',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
