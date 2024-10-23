import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/components/LabelItem/labelItem.dart';
import 'package:takeed/components/button/button.dart';
import 'package:takeed/core/Extensions/navigation.dart';
import 'package:takeed/core/Routes/routes.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class ProfilePage extends StatelessWidget {
  final UserProfile user = UserProfile(
    name: "John Doe",
    email: "john.doe@example.com",
    phone: "+123 456 7890",
    profilePicture:
        "https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o=",
  );

  ProfilePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Info',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.profilePicture),
                radius: 50,
              ),
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
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.GrayColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.perm_identity),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text('${user.name}', style: TextStyles.font18BlackBold),
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
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.GrayColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.email_outlined),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text('${user.email}', style: TextStyles.font18BlackBold),
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
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.GrayColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.phone_android),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text('${user.phone}', style: TextStyles.font18BlackBold),
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
                  context.pushNamed(Routes.bottomnavigation);
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
  final String profilePicture;

  UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.profilePicture,
  });
}
