import 'package:flutter/material.dart';
import 'package:takeed/colors/myapp_colors.dart';

class MyTheme{
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MyAppColors.primary,
      selectedItemColor: MyAppColors.white,
      unselectedItemColor: MyAppColors.gray555,
      selectedIconTheme: IconThemeData(
        size: 36
      ),
        showSelectedLabels: true,
      type: BottomNavigationBarType.fixed
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 50,fontWeight: FontWeight.w500
      )
    )

  );
}