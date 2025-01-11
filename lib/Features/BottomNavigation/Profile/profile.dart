import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/components/LabelItem/labelItem.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class ProfilePage extends StatelessWidget {
  final UserProfile user = UserProfile(
      name: "John Doe",
      email: "john.doe@example.com",
      phone: "+123 456 7890",
      profilePicture: const Icon(
        Icons.person,
        size: 70,
      ));

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Info',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: ColorManager.GrayColor,
                child: user.profilePicture,
              ),
              SizedBox(height: 10.h),
              Text(
                'Hello Traveller',
                style: TextStyles.font18BlackBold,
              ),
              SizedBox(height: 20.h),
              Labelitem(
                label: 'Name',
                labelStyle: TextStyles.font10RegularDarkGray,
                containerheight: 68.h,
                left_Shift: 20,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.GrayColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.perm_identity),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(user.name, style: TextStyles.font18GrayRegular),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Labelitem(
                label: 'Email',
                labelStyle: TextStyles.font10RegularDarkGray,
                containerheight: 68.h,
                left_Shift: 20,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.GrayColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.email_outlined),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(user.email, style: TextStyles.font18GrayRegular),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Labelitem(
                label: 'Phone',
                labelStyle: TextStyles.font10RegularDarkGray,
                containerheight: 68.h,
                left_Shift: 20,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.GrayColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.phone_android),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(user.phone, style: TextStyles.font18GrayRegular),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 130.h,
              ),
              AppTextButton(
                  buttonText: 'Confirm',
                  buttonHeight: 56.h,
                  textStyle: TextStyles.font18WhiteRegular,
                  onPressed: () {}),
              SizedBox(height: 14.h),
              TextButton(
                onPressed: () {
                  //  context.pushNamed(Routes.bottomnavigation);
                  Navigator.pop(context);
                },
                child: Text(
                  "Skip",
                  style: TextStyles.font18orangeRegular,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserProfile {
  final String name;
  final String email;
  final String phone;
  final Icon profilePicture;

  UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.profilePicture,
  });
}
