import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/Flight/FlightSearchResult/FlightSearchResultCard.dart';
import 'package:takeed/Features/Flight/FlightSearchResult/filterSearchResult.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/Logic/cubit/flight_cubit.dart';

class FlightSearchResultPage extends StatefulWidget {
  const FlightSearchResultPage({super.key});

  @override
  State<FlightSearchResultPage> createState() => _FlightSearchResultPageState();
}

class _FlightSearchResultPageState extends State<FlightSearchResultPage> {
  int itemsToShow = 3; // Start by showing 10 items

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: InkWell(
                  onTap: () => showFlightFilterDialog(context),
                  child: Image.asset(
                    'assets/images/home/filter.png',
                    width: 30.w,
                    height: 30.h,
                  )),
            ),
          ],
          title: const Text('Search Result'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocBuilder<FlightCubit, FlightState>(
          builder: (context, state) {
            final cubit = context.watch<FlightCubit>();
            final flight = cubit.filterList.isEmpty
                ? cubit.flightsearchmodel
                : cubit.filterList;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), // Prevent scrolling
                    itemCount: itemsToShow < flight.length
                        ? itemsToShow
                        : flight.length,
                    itemBuilder: (context, index) {
                      final itinerary = flight[index].itineraries!.first;
                      final segment = itinerary.segments!.first;
                      return Column(
                        children: [
                          index == 0
                              ? Text(flight.length.toString())
                              : const SizedBox(),
                          FlightCard(
                            index: flight[index],
                            airlineLogo:
                                segment.carrierCode, // Placeholder for logo
                            airlineName: segment.carrierCode ??
                                '', // You can map this to the actual name if needed
                            flightNumber: segment.number ?? '',
                            departureTime: segment.departure!.at ?? '',
                            arrivalTime: segment.arrival!.at ?? '',
                            duration: segment.duration ?? '',
                            departureAirport: segment.departure!.iataCode ?? '',
                            arrivalAirport: segment.arrival!.iataCode ?? '',
                            price: flight[index].price!.grandTotal ?? '',
                          ),
                        ],
                      );
                    },
                  ),
                  if (itemsToShow <
                      flight.length) // Only show button if there are more items
                    TextButton(
                      onPressed: () {
                        setState(() {
                          itemsToShow += 3; // Show 10 more items
                        });
                      },
                      child: const Text('Show More'),
                    ),
                ],
              ),
            );
          },
        ));
  }
}

// Usage example in your main widget:
void showFlightFilterDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const FlightFilterDialog();
    },
  ).then((filters) {
    if (filters != null) {
      // Use the selected filter values here
      print(filters);
    }
  });
}
