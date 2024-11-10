import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/Flight/FlightDetails/flightDetailsPage.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flightSearchModel.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/core/Extensions/navigation.dart';
import 'package:takeed/core/Routes/routes.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class FlightCard extends StatelessWidget {
  final String? airlineLogo;
  final String airlineName;
  final String flightNumber;
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final String departureAirport;
  final String arrivalAirport;
  final String price;
  final FlightSearchData index;

  FlightCard({
    super.key,
    this.airlineLogo,
    required this.index,
    required this.airlineName,
    required this.flightNumber,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.departureAirport,
    required this.arrivalAirport,
    required this.price,
  });
  static String getDate({required String time}) {
    DateTime dateTime = DateTime.parse(time);
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}"; // e.g., "5/11/2024"
  }

  static String getTime({required String time}) {
    DateTime dateTime = DateTime.parse(time);
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}"; // e.g., "17:55"
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328.w,
      height: 224.h,
      child: Card(
        elevation: 2,
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 8.0.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 85.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(airlineName,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 8.0.w),
                        Text(flightNumber),
                        const Spacer(),
                        Text(duration, style: TextStyles.font12RegularDarkGray),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(getDate(time: departureTime),
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                Text(getTime(time: departureTime)),
                                SizedBox(width: 3.0.w),
                                Text(departureAirport),
                              ],
                            ),
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
                            const CircleAvatar(
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
                            Text(getDate(time: arrivalTime),
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                Text(getTime(time: arrivalTime)),
                                SizedBox(width: 3.0.w),
                                Text(arrivalAirport),
                              ],
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
                  const Icon(
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
                  const Spacer(),
                  Text('From ', style: TextStyles.font12RegularDarkGray),
                  Text(
                    '\$$price',
                    style: TextStyles.font16BlackRegular,
                  )
                ],
              ),
              SizedBox(height: 10.0.h),
              AppTextButton(
                  buttonText: 'Check',
                  textStyle: TextStyles.font18WhiteRegular,
                  onPressed: () {
                    context.pushPage(Routes.flightDetails,
                        page: FlightDetailsPage(
                          flightdetails: index,
                        ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
