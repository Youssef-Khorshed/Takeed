import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/create_flight_order.dart';
import 'package:takeed/Features/Payment/paymentFooter.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

// ignore: must_be_immutable
class Paymentbody extends StatelessWidget {
  CreateFlightOrder flightdetails;

  Paymentbody({super.key, required this.flightdetails});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(10.h),
            color: ColorManager.GrayMediumColor,
            width: 360.w,
            height: 203.h,
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Takeed', style: TextStyles.font14DarkBlueRegular),
                    const Spacer(),
                    const Icon(Icons.calendar_month_outlined),
                    SizedBox(width: 10.w),
                    Text(
                      '15/7/2022',
                      style: TextStyles.font14BlackRegular,
                    )
                  ],
                ),
                SizedBox(height: 30.h),
                SizedBox(height: 25.h),
                Row(
                  children: [
                    Text(
                      'Total',
                      style: TextStyles.font14BlackRegular,
                    ),
                    const Spacer(),
                    Text(
                      '\SAR ${flightdetails.flightOffers!.first.price!.total}',
                      style: TextStyles.font22orangeBold,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: Paymentfooter(
            createFlightOrder: flightdetails,
            amount:
                double.parse(flightdetails.flightOffers!.first.price!.total!)
                        .round()
                        .toInt() *
                    100,
          ),
        )
      ],
    );
  }
}
