import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:takeed/Features/Auth/Login/LoginLogic.dart';
import 'package:takeed/Features/Auth/Login/email_phoneChoice.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/components/text_box/authTextfield.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';
import 'package:takeed/core/Validation/appRegex.dart';
import 'package:takeed/core/Validation/check_emptyText.dart';
import 'package:takeed/core/Validation/customvalidation.dart';

class LoginscreenBody extends StatefulWidget {
  const LoginscreenBody({super.key});

  @override
  State<LoginscreenBody> createState() => _LoginscreenBodyState();
}

class _LoginscreenBodyState extends State<LoginscreenBody> {
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController loginpasscontroller;
  late TextEditingController loginEmailcontroller;
  final key = GlobalKey<FormState>();
  String? selectedChoice;
  @override
  void initState() {
    super.initState();
    loginpasscontroller = TextEditingController();
    loginEmailcontroller = TextEditingController();
    listenPasswordChanges();
  }

  void listenPasswordChanges() {
    loginpasscontroller.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(loginpasscontroller.text);
        hasUpperCase = AppRegex.hasUpperCase(loginpasscontroller.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(loginpasscontroller.text);
        hasNumber = AppRegex.hasNumber(loginpasscontroller.text);
        hasMinLength = AppRegex.hasMinLength(loginpasscontroller.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
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
                  ToggleEmailPhone(),
                  SizedBox(height: 20.h),
                  Text(
                    'Password',
                    style: TextStyles.font14BlackRegular,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AppTextFormField(
                    suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                    controller: loginpasscontroller,
                    hintText: '***********',
                    validator: (value) {
                      return Checktext.validateEmptyText(value, 'password');
                    },
                  ),
                  loginpasscontroller.text.isNotEmpty
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
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (context) {}),
                      Text(
                        'Remember me',
                        style: TextStyles.font12RegularDarkGray,
                      ),
                      const Spacer(),
                      Text(
                        'Forgot Password?',
                        style: TextStyles.font14orangeRegular,
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  AppTextButton(
                    buttonText: 'Login',
                    buttonHeight: 56.h,
                    onPressed: () async {
                      await loginlogic(
                          context: context, selectedChoice: selectedChoice);
                    },
                    textStyle: TextStyles.font18WhiteRegular,
                  ),
                  SizedBox(height: 35.h),
                  Row(
                    children: [
                      Container(
                        height: 1,
                        color: ColorManager.GrayColor,
                        width: 110.w,
                      ),
                      Text(
                        ' Or sign in with ',
                        style: TextStyles.font12RegularDarkGray,
                      ),
                      Container(
                        height: 1,
                        color: ColorManager.GrayMediumColor,
                        width: 110.w,
                      )
                    ],
                  ),
                  SizedBox(height: 35.h),
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
                  SizedBox(height: 30.h)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
