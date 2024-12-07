import 'package:flutter/material.dart';
import 'package:takeed/core/Theme/Color/colors.dart';

class Apptheme {
  // Light Theme.....
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.primaryOrnage),
    //   primaryColorLight: ColorManager.primaryOrnage,
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Colors.black),
    // primaryColor: ColorManager.primaryOrnage,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
    scaffoldBackgroundColor: Colors.white,
  );

//Dark Theme...
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.primaryOrnage),
    //   primaryColorLight: ColorManager.primaryOrnage,
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Colors.black),
    // primaryColor: ColorManager.primaryOrnage,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
    scaffoldBackgroundColor: ColorManager.textcolor,
  );
}
