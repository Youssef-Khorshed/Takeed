import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/Auth/Presentation/UI/Signup/SignupBody.dart';
import 'package:takeed/Features/Auth/Presentation/UI/Signup/SignupFooter.dart';

class Signupscrenn extends StatelessWidget {
  const Signupscrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.only(top: 50.h, bottom: 24.h),
      child: const CustomScrollView(
        slivers: [SignUpscreenBody(), SignupscreenFooter()],
      ),
    )));
  }
}
