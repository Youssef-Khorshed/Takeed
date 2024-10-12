import 'package:flutter/material.dart';
import 'package:takeed/config/theme/my_theme.dart';
import 'package:takeed/core/app_routes.dart';
import 'package:takeed/screens/home/home_screen.dart';
import 'package:takeed/screens/search/flight_search_screen.dart';
import 'package:takeed/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.allRoutes,
      initialRoute: AppRoutes.splash,
    );
  }
}

