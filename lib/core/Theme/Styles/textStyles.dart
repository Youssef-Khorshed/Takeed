import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/font_weight_helper.dart';

class TextStyles {
  static TextStyle font24BlackRegular = TextStyle(
      fontWeight: FontWeightHelper.regular,
      fontSize: 24.sp,
      color: ColorManager.textcolor);
  static TextStyle font24BlackBold = TextStyle(
      fontWeight: FontWeightHelper.bold,
      fontSize: 24.sp,
      color: ColorManager.textcolor);

  static TextStyle font32BlackBold = TextStyle(
      fontWeight: FontWeightHelper.bold,
      fontSize: 32.sp,
      color: ColorManager.textcolor);

  static TextStyle font32BlueBold = TextStyle(
      fontWeight: FontWeightHelper.bold,
      fontSize: 32.sp,
      color: ColorManager.DarkBlueColor);
  static TextStyle font16BlackRegular = TextStyle(
      fontWeight: FontWeightHelper.regular,
      fontSize: 16.sp,
      color: ColorManager.textcolor);

  static TextStyle font14GrayRegular = TextStyle(
      fontWeight: FontWeightHelper.regular,
      fontSize: 14.sp,
      color: ColorManager.primarytextGrayColor);

  static TextStyle font14BlackRegular = TextStyle(
      fontWeight: FontWeightHelper.regular,
      fontSize: 14.sp,
      color: ColorManager.textcolor);

  static TextStyle font14WhiteRegular = TextStyle(
      fontWeight: FontWeightHelper.regular,
      fontSize: 14.sp,
      color: Colors.white);
  static TextStyle font14DarkBlueRegular = TextStyle(
      fontWeight: FontWeightHelper.regular,
      fontSize: 14.sp,
      color: ColorManager.DarkBlueColor);

  static TextStyle font18WhiteRegular = TextStyle(
      fontWeight: FontWeightHelper.regular,
      fontSize: 18.sp,
      color: Colors.white);
  static TextStyle font10RegularDarkGray = TextStyle(
      fontWeight: FontWeightHelper.regular,
      fontSize: 10.sp,
      color: ColorManager.DarkGrayColor);

  static TextStyle font12RegularDarkGray = TextStyle(
      fontWeight: FontWeightHelper.regular,
      fontSize: 12.sp,
      color: ColorManager.DarkGrayColor);

  static TextStyle font18orangeRegular = TextStyle(
      fontWeight: FontWeightHelper.regular,
      fontSize: 18.sp,
      color: ColorManager.primaryOrnage);

  static TextStyle font22orangeBold = TextStyle(
      fontWeight: FontWeightHelper.bold,
      fontSize: 22.sp,
      color: ColorManager.primaryOrnage);
}
