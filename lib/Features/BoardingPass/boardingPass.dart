// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import 'package:takeed/Features/BoardingPass/BoardingFooter.dart';
import 'package:takeed/Features/BoardingPass/boardingBody.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/create_flight_order.dart';

class BoardingPass extends StatefulWidget {
  final CreateFlightOrder offer;
  const BoardingPass({
    super.key,
    required this.offer,
  });

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
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
        title: const Text(
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
              Boardingbody(
                offers: widget.offer,
              ),
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
