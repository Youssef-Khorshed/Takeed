import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class Flightticketrow extends StatelessWidget {
  const Flightticketrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text('5.50', style: TextStyles.font24BlackBold),
            Text('DEL', style: TextStyles.font16BlackRegular),
          ],
        ),
        SizedBox(
          width: 25.w,
        ),
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
            child: Icon(Icons.airplanemode_active, color: Colors.white)),
        Container(
          width: 40.w,
          height: 2.h,
          color: ColorManager.GrayColor,
        ),
        CircleAvatar(
          radius: 4.r,
          backgroundColor: ColorManager.GrayColor,
        ),
        SizedBox(
          width: 25.w,
        ),
        Column(
          children: [
            Text('7.30', style: TextStyles.font24BlackBold),
            Text('CUU', style: TextStyles.font16BlackRegular),
          ],
        ),
      ],
    );
  }
}
