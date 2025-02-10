import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/components/text_box/authTextfield.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';
import 'package:takeed/core/Validation/appRegex.dart';
import 'package:takeed/core/Validation/check_emptyText.dart';
import 'package:takeed/core/Validation/customvalidation.dart';

class SignUpscreenBody extends StatefulWidget {
  const SignUpscreenBody({super.key});

  @override
  State<SignUpscreenBody> createState() => _SignUpscreenBodyState();
}

class _SignUpscreenBodyState extends State<SignUpscreenBody> {
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController passcontroller;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  final signupKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    passcontroller = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    listenPasswordChanges();
  }

  void listenPasswordChanges() {
    passcontroller.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passcontroller.text);
        hasUpperCase = AppRegex.hasUpperCase(passcontroller.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passcontroller.text);
        hasNumber = AppRegex.hasNumber(passcontroller.text);
        hasMinLength = AppRegex.hasMinLength(passcontroller.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Form(
        key: signupKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Account',
                    style: TextStyles.font28BlackBold,
                  ),
                  SizedBox(height: 19.h),
                  Text(
                    'Welcome back to the app',
                    style: TextStyles.font14GrayRegular.copyWith(height: 1.8.h),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    'Name',
                    style: TextStyles.font14BlackRegular,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AppTextFormField(
                    controller: emailController,
                    hintText: 'Jhon Doe',
                    validator: (value) {
                      return Checktext.validateEmptyText(value, 'email');
                    },
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Email',
                    style: TextStyles.font14BlackRegular,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AppTextFormField(
                    controller: emailController,
                    hintText: 'Email@example.com',
                    validator: (value) {
                      return Checktext.validateEmptyText(value, 'email');
                    },
                  ),

                  SizedBox(height: 10.h),
                  // AppTextFormField(
                  //   controller: phoneController,
                  //   preifxwidget: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       CountryListPick(
                  //           theme: CountryTheme(
                  //               isShowTitle: false, isShowCode: false),
                  //           initialSelection: '+61',
                  //           onChanged: (value) {}),
                  //       Container(
                  //         width: 2.w,
                  //         height: 24.h,
                  //         color: ColorManager.GrayColor2,
                  //       ),
                  //     ],
                  //   ),
                  //   hintText: '  Your number',
                  //   validator: (value) {
                  //     return Checktext.validateEmptyText(value, 'number');
                  //   },
                  // ),

                  Text(
                    'Password',
                    style: TextStyles.font14BlackRegular,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  AppTextFormField(
                    controller: passcontroller,
                    hintText: '**********',
                    validator: (value) {
                      return Checktext.validateEmptyText(value, 'password');
                    },
                  ),
                  passcontroller.text.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: PasswordValidation(
                              hasLowerCase: hasLowerCase,
                              hasUpperCase: hasUpperCase,
                              hasSpecialCharacters: hasSpecialCharacters,
                              hasNumber: hasNumber,
                              hasMinLength: hasMinLength),
                        )
                      : const SizedBox(),
                  SizedBox(height: 25.h),
                  AppTextButton(
                    buttonHeight: 56.h,
                    buttonText: 'Creat Account',
                    onPressed: () async {
                      if (signupKey.currentState!.validate()) {}
                    },
                    textStyle: TextStyles.font18WhiteRegular,
                  ),
                  SizedBox(height: 25.h),
                  Row(
                    children: [
                      Container(
                        height: 1,
                        color: ColorManager.GrayColor,
                        width: 110.w,
                      ),
                      Text(
                        ' Or sign up with ',
                        style: TextStyles.font10RegularDarkGray,
                      ),
                      Container(
                        height: 1,
                        color: ColorManager.GrayColor,
                        width: 110.w,
                      )
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/googleicon.svg',
                        height: 46.h,
                        width: 46.w,
                      ),
                      SvgPicture.asset(
                        'assets/svgs/facebookicon.svg',
                        height: 46.h,
                        width: 46.w,
                      ),
                      SvgPicture.asset(
                        'assets/svgs/appleicon.svg',
                        height: 46.h,
                        width: 46.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
