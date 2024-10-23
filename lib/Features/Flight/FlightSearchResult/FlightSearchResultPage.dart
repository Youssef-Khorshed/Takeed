import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/Flight/FlightSearchResult/FlightSearchFlightCard.dart';
import 'package:takeed/Features/home/Home/HomeScreen.dart';

class FlightSearchResultPage extends StatelessWidget {
  const FlightSearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Result'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBottomSheet(context),
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlightCard(
              //      airlineLogo: 'assets/indigo_logo.png',
              airlineName: 'Indigo',
              flightNumber: 'IN 230',
              departureTime: '5.50',
              arrivalTime: '7.30',
              duration: '01 hr 40min',
              departureAirport: 'DEL (Delhi)',
              arrivalAirport: 'CCU (Kolkata)',
              price: 230,
            ),
            FlightCard(
              //  airlineLogo: 'assets/delta_logo.png',
              airlineName: 'Delta',
              flightNumber: 'IN 230',
              departureTime: '4.30',
              arrivalTime: '6.30',
              duration: '01 hr 40min',
              departureAirport: 'DEL (Delhi)',
              arrivalAirport: 'CCU (Kolkata)',
              price: 360,
            ),
            FlightCard(
              //     airlineLogo: 'assets/united_logo.png',
              airlineName: 'United Airlines',
              flightNumber: 'IN 230',
              departureTime: '2.20',
              arrivalTime: '3.30',
              duration: '01 hr 40min',
              departureAirport: 'DEL (Delhi)',
              arrivalAirport: 'DAC (Kolkata)',
              price: 550,
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            height:
                MediaQuery.of(context).size.height * 0.8, // Adjust as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Homescreen(
                  showINsheet: false,
                )), // Show your existing content
                // Add more widgets here if needed
              ],
            ),
          ),
        );
      },
    );
  }
}
