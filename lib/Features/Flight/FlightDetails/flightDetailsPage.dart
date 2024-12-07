import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/Flight/FlightDetails/flightDetailsBody.dart';
import 'package:takeed/Features/Flight/FlightDetails/flightDetailsFooter.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flightSearchModel.dart';

class FlightDetailsPage extends StatelessWidget {
  FlightSearchData flightdetails;
  FlightDetailsPage({super.key, required this.flightdetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flight details'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flightdetailsbody(
                flightdetails: flightdetails,
              ),
              SizedBox(height: 30.h),
              const Flightdetailsfooter()
            ],
          ),
        ),
      ),
    );
  }
}
