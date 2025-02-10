import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/core/Extensions/navigation.dart';
import 'package:takeed/core/Routes/routes.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();

  void _verifyOtp() {
    String otp = _otpController1.text +
        _otpController2.text +
        _otpController3.text +
        _otpController4.text;
    // Handle OTP verification logic here
    print("OTP entered: $otp");
    // For example, navigate to the next screen or show an error
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100.h),
            Text(
              'OTP Verification',
              style: TextStyles.font28BlackBold,
            ),
            Text(
              'Enter the verification code we just sent on your phone number.',
              style: TextStyles.font18GrayRegular,
            ),
            SizedBox(height: 60.h),
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _otpTextField(_otpController1),
                    SizedBox(width: 40.w),
                    _otpTextField(_otpController2),
                    SizedBox(width: 40.w),
                    _otpTextField(_otpController3),
                    SizedBox(width: 40.w),
                    _otpTextField(_otpController4),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            AppTextButton(
                buttonText: 'Verify',
                buttonHeight: 48.h,
                textStyle: TextStyles.font18WhiteRegular,
                onPressed: () {
                  context.pushNamed(Routes.bottomnavigation);
                })
          ],
        ),
      ),
    );
  }

  Widget _otpTextField(TextEditingController controller) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24),
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus(); // Move to the next field
          }
        },
      ),
    );
  }
}
