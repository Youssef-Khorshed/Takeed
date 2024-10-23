import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BoardingPass/boardingBody.dart';
import 'package:takeed/Features/home/MyBooking/mybookingDetails.dart';
import 'package:takeed/components/Flight/airportDetails.dart';
import 'package:takeed/components/Flight/flightTicketRow.dart';
import 'package:takeed/components/Line/line.dart';
import 'package:takeed/core/Extensions/navigation.dart';
import 'package:takeed/core/Routes/routes.dart';

class Mybooking extends StatelessWidget {
  const Mybooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Booking'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_sharp)),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(_createRoute());
                  },
                  child: Column(
                    children: [
                      Flightticketrow(),
                      Airportdetails(),
                      Line(upperpadding: 5, lowerpadding: 2),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(_createRoute());
                  },
                  child: Column(
                    children: [
                      Flightticketrow(),
                      Airportdetails(),
                      Line(upperpadding: 5, lowerpadding: 2),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(_createRoute());
                  },
                  child: Column(
                    children: [
                      Flightticketrow(),
                      Airportdetails(),
                      Line(upperpadding: 5, lowerpadding: 2),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(_createRoute());
                  },
                  child: Column(
                    children: [
                      Flightticketrow(),
                      Airportdetails(),
                      Line(upperpadding: 5, lowerpadding: 2),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          Mybookingdetails(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Start from the right
        const end = Offset.zero; // End at the original position
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
