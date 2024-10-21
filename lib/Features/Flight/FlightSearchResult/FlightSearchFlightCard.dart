import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/Flight/FlightDetails/flightDetailsPage.dart';
import 'package:takeed/Features/home/homeScreen.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/core/Extensions/navigation.dart';
import 'package:takeed/core/Routes/routes.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class FlightSearchResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Result'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlightCard(
              //      airlineLogo: 'assets/indigo_logo.png',
              airlineName: 'Indigo',
              flightNumber: 'IN 230',
              departureTime: '5.50',
              arrivalTime: '7.30',
              duration: '01 hr 40min',
              departureAirport: 'DEL (Delhi)',
              arrivalAirport: 'CCU (Kolkata)',
              price: 230,
            ),
            FlightCard(
              //  airlineLogo: 'assets/delta_logo.png',
              airlineName: 'Delta',
              flightNumber: 'IN 230',
              departureTime: '4.30',
              arrivalTime: '6.30',
              duration: '01 hr 40min',
              departureAirport: 'DEL (Delhi)',
              arrivalAirport: 'CCU (Kolkata)',
              price: 360,
            ),
            FlightCard(
              //     airlineLogo: 'assets/united_logo.png',
              airlineName: 'United Airlines',
              flightNumber: 'IN 230',
              departureTime: '2.20',
              arrivalTime: '3.30',
              duration: '01 hr 40min',
              departureAirport: 'DEL (Delhi)',
              arrivalAirport: 'DAC (Kolkata)',
              price: 550,
            ),
          ],
        ),
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  final String? airlineLogo;
  final String airlineName;
  final String flightNumber;
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final String departureAirport;
  final String arrivalAirport;
  final int price;

  FlightCard({
    this.airlineLogo,
    required this.airlineName,
    required this.flightNumber,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.departureAirport,
    required this.arrivalAirport,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328.w,
      height: 230.h,
      child: Card(
        elevation: 2,
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 8.0.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 85.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(airlineName,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 8.0.w),
                        Text(flightNumber),
                        Spacer(),
                        Text(duration, style: TextStyles.font12RegularDarkGray),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(departureTime,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            Text(departureAirport),
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 4.r,
                              backgroundColor: ColorManager.GrayColor,
                            ),
                            Container(
                              width: 40.w,
                              height: 2.h,
                              color: ColorManager.GrayColor,
                            ),
                            CircleAvatar(
                                backgroundColor: ColorManager.primaryOrnage,
                                child: Icon(Icons.airplanemode_active,
                                    color: Colors.white)),
                            Container(
                              width: 40.w,
                              height: 2.h,
                              color: ColorManager.GrayColor,
                            ),
                            CircleAvatar(
                              radius: 4.r,
                              backgroundColor: ColorManager.GrayColor,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(arrivalTime,
                                style: TextStyles.font16BlackRegular),
                            Text(
                              arrivalAirport,
                              style: TextStyles.font10RegularDarkGray,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0.h),
              Row(
                children: [
                  Icon(
                    Icons.chair_outlined,
                    color: ColorManager.DarkGrayColor,
                  ),
                  SizedBox(
                    width: 3.h,
                  ),
                  Text(
                    'Business Class',
                    style: TextStyles.font10RegularDarkGray,
                  ),
                  Spacer(),
                  Text('From ', style: TextStyles.font12RegularDarkGray),
                  Text(
                    '\$$price',
                    style: TextStyles.font16BlackRegular,
                  )
                ],
              ),
              SizedBox(height: 15.0.h),
              AppTextButton(
                  buttonText: 'Check',
                  textStyle: TextStyles.font18WhiteRegular,
                  onPressed: () {
                    context.pushPage(Routes.flightDetails,
                        page: FlightDetailsPage());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
