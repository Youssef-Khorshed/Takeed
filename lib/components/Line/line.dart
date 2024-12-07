import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/core/Theme/Color/colors.dart';

class Line extends StatelessWidget {
  int upperpadding;
  int lowerpadding;
  Line({super.key, required this.upperpadding, required this.lowerpadding});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: upperpadding.h),
      Container(
        height: 1.h,
        width: double.infinity,
        color: ColorManager.GrayColor2,
      ),
      SizedBox(height: lowerpadding.h),
    ]);
  }
}
