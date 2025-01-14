import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moyasar/moyasar.dart';
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
    TextEditingController username = TextEditingController();
    TextEditingController expiredate = TextEditingController();
    TextEditingController cvv = TextEditingController();
    TextEditingController cardnumber = TextEditingController();

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
                    '\$ ${flightdetails.flightOffers!.first.price!.total}',
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
              controller: cardnumber,
              decoration: const InputDecoration(
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
              controller: username,
              decoration: const InputDecoration(
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
                    controller: cvv,
                    decoration: const InputDecoration(
                      hintText: '000',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expiry date',
                    style: TextStyles.font16BlackRegular,
                  ),
                  TextField(
                    controller: expiredate,
                    decoration: const InputDecoration(
                      hintText: '09/26',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Paymentfooter(
          cardFormModel: CardFormModel(
              name: username.text, cvc: cvv.text, month: '10', year: '26'),
          amount: double.parse(flightdetails.flightOffers!.first.price!.total!),
        )
      ],
    );
  }
}
