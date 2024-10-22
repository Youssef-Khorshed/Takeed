import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/components/button/button2.dart';
import 'package:takeed/core/Extensions/navigation.dart';
import 'package:takeed/core/Routes/routes.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class Paymentfooter extends StatelessWidget {
  const Paymentfooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.asset('assets/images/paymentcards.png'),
      SizedBox(height: 35.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              AppTextButton(
                  buttonHeight: 56.h,
                  buttonWidth: 296.w,
                  buttonText: 'Confirm',
                  textStyle: TextStyles.font18WhiteRegular,
                  onPressed: () {
                    context.pushNamed(Routes.boardingPass);
                  }),
              SizedBox(
                height: 13.w,
              ),
              OutlinedTextButton(
                  buttonText: 'Cancel',
                  buttonWidth: 296.w,
                  buttonHeight: 56.h,
                  textStyle: TextStyles.font18orangeRegular,
                  onPressed: () {}),
            ],
          ),
        ],
      ),
    ]);
  }
}
