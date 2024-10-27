import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/core/Theme/Color/colors.dart';

class Labelitem extends StatelessWidget {
  String label;
  TextStyle labelStyle;
  double containerheight;
  double? left_Shift;
  double? top_Shift;
  Widget child;
  Labelitem(
      {super.key,
      required this.label,
      this.left_Shift,
      required this.labelStyle,
      required this.containerheight,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: containerheight.h,
        ),
        child,
        Positioned(
            top: top_Shift ?? 0,
            left: left_Shift ?? 15,
            child: Container(
                color: ColorManager.homescreenBackgroundColor,
                padding: EdgeInsets.all(4.r),
                child: Text(label, style: labelStyle))),
      ],
    );
  }
}
