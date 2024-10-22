import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:takeed/Features/BoardingPass/BoardingFooter.dart';
import 'package:takeed/Features/BoardingPass/boardingBody.dart';
import 'package:takeed/core/Theme/Color/colors.dart';
import 'package:takeed/core/Theme/Styles/textStyles.dart';

class BoardingPass extends StatefulWidget {
  @override
  State<BoardingPass> createState() => _BoardingPassState();
}

class _BoardingPassState extends State<BoardingPass> {
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          "Boarding Pass",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Screenshot(
          controller: screenshotController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Boardingbody(),
              Boardingfooter(
                screenshotController: screenshotController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
