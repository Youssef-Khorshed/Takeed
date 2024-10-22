import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class Airportdetails extends StatelessWidget {
  const Airportdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
