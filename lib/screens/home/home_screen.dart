import 'package:flutter/material.dart';
import 'package:takeed/colors/myapp_colors.dart';


class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Takeed'),
        titleTextStyle: TextStyle(fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white),
        backgroundColor: MyAppColors.primary,
        centerTitle: true,
      ),
    );
  }

}