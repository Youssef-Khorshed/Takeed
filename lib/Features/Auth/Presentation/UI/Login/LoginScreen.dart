import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/Auth/Presentation/UI/Login/LoginBody.dart';
import 'package:takeed/Features/Auth/Presentation/UI/Login/LoginFooter.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.only(top: 50.h, bottom: 24.h),
      child: const CustomScrollView(
        slivers: [LoginscreenBody(), LoginscreenFooter()],
      ),
    )));
  }
}
