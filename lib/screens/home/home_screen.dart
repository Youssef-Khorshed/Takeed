import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takeed/colors/myapp_colors.dart';


class HomeScreen extends StatelessWidget{
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