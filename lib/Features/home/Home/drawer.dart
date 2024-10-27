import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/Theme/themecubit.dart';
import 'package:takeed/core/Extensions/navigation.dart';
import 'package:takeed/core/Routes/routes.dart';
import 'package:takeed/core/Theme/Color/colors.dart';

Widget buildDrawer(
    {required BuildContext context, required ThemeCubit themcubit}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: ColorManager.primaryOrnage,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tayar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Book your flight with ease',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            // Handle home action
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.flight_takeoff),
          title: const Text('My Flights'),
          onTap: () {
            // Handle my flights action
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.history),
          title: const Text('Theme'),
          onTap: () async {
            ThemeCubit themeCubit = context.read<ThemeCubit>();
            themeCubit.toggleTheme();
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            // Handle settings action
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.help),
          title: const Text('Help'),
          onTap: () {
            // Handle help action
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            // Handle logout action
            context.pushNamed(Routes.login);
          },
        ),
      ],
    ),
  );
}
