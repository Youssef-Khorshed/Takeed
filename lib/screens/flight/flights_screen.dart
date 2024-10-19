
import 'package:flutter/material.dart';
import 'package:takeed/colors/myapp_colors.dart';
import 'package:takeed/screens/flight/single_flight_card.dart';

class Flights extends StatelessWidget{
  const Flights({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyAppColors.primary ,
      ) ,
      backgroundColor: MyAppColors.white,
      body:
      Column(
        children: [
          SingleFlightCard(),
          SingleFlightCard(),
        ],
      ),

    );
  }

}