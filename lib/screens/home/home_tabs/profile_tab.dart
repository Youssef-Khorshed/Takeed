import 'package:flutter/material.dart';
import 'package:takeed/colors/myapp_colors.dart';
import 'package:takeed/core/app_assets.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyAppColors.white,
      body: Column(
          children: [
           Image.asset( MyAppAssets.lightProfileTabImgUrl),
            Expanded(
              child: TextField(
                //controller: firstController,
                decoration: InputDecoration(
                    labelText: 'To',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.flight_land_outlined)
                ),
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,
              ),
            ),
          ]
      ),
    );
  }
}