import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/components/button/button2.dart';
import 'package:takeed/core/Extensions/navigation.dart';
import 'package:takeed/core/Routes/routes.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class Flightdetailsfooter extends StatelessWidget {
  const Flightdetailsfooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: OutlinedTextButton(
              buttonText: 'Cancel',
              buttonWidth: 156.w,
              buttonHeight: 56.h,
              textStyle: TextStyles.font18orangeRegular,
              onPressed: () {}),
        ),
        SizedBox(
          width: 15.w,
        ),
        Expanded(
          child: AppTextButton(
              buttonHeight: 56.h,
              buttonWidth: 156.w,
              buttonText: 'Confirm',
              textStyle: TextStyles.font18WhiteRegular,
              onPressed: () {
                context.pushNamed(Routes.payment);
              }),
        ),
      ],
    );
  }
}
