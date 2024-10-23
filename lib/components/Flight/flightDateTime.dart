import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/components/Flight/airportDetails.dart';
import 'package:takeed/components/Line/line.dart';
import 'package:takeed/components/text_box/text_box.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class Flightdatetime extends StatelessWidget {
  const Flightdatetime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
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
        const Expanded(
          child: MyTextBox(
            prefixIcon: Icon(Icons.timer_outlined),
            readonly: false,
            labelText: '09.30',
            hintText: 'hintText',
          ),
        ),
      ],
    );
  }
}
