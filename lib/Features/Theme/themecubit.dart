import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:takeed/core/Theme/AppTheme/appTheme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(Apptheme.lightTheme);

  void toggleTheme() {
    emit(state == Apptheme.lightTheme
        ? Apptheme.darkTheme
        : Apptheme.lightTheme);
  }
}
