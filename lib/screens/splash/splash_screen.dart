import 'package:flutter/material.dart';
import 'package:takeed/core/app_assets.dart';
import 'package:takeed/core/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 3), () {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      }
    });
    return Container(
        child:Image.asset(MyAppAssets.lightSplashImgUrl, fit: BoxFit.fill)
    );
  }
}