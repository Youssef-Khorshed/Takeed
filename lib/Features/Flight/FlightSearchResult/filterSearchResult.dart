import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flightFilterModel.dart';
import 'package:takeed/Features/BottomNavigation/Home/Presentation/Logic/cubit/flight_cubit.dart';

class FlightFilterDialog extends StatefulWidget {
  const FlightFilterDialog({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FlightFilterDialogState createState() => _FlightFilterDialogState();
}

class _FlightFilterDialogState extends State<FlightFilterDialog> {
  // Price // segments number // duration
  RangeValues priceRange = const RangeValues(1500, 10000);
  Map<String, int> numberOfStops = {
    "Direct Flight": 0,
    "one stop ": 1,
    "two or more stops": 2,
  };
  int numberOfStopsValue = 2;
  Map<String, String> depatureTime = {
    // 6  -> 12 - > 18 -> 24
    'Before 6:00 AM': 'Before',
    'Between 6:00 AM : ': 'Between',
    'After 12:00 PM : 6:00 PM': 'After 12:00 PM',
    'After 6:00 PM': 'After 6:00 PM',
  };
  Map<String, String> arrivalTime = {
    // 6  -> 12 - > 18 -> 24
    'Before 6:00 AM': 'Before',
    'Between 6:00 AM : ': 'Between',
    'After 12:00 PM : 6:00 PM': 'After 12:00 PM',
    'After 6:00 PM': 'After 6:00 PM',
  };
  String depatureTimeValue = "Before";
  String arrivalTimeValue = "After 6:00 PM";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filter Flights'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ExpansionTile(
                title: const Text('Number of Stops'),
                children: <Widget>[
                  buildStops(),
                ]),
            ExpansionTile(
                title: const Text('Select Price Range:'), //

                children: <Widget>[
                  buildPriceRange(),
                ]),
            ExpansionTile(
                title: const Text('Select Departure Time:'), //
                //

                children: <Widget>[
                  buildDepatureTime(),
                ]),
            ExpansionTile(
                title: const Text('Select Arrival Time:'), //

                children: <Widget>[
                  buildArrivalTime(),
                ]),
          ],
        ),
      ),
      actions: const <Widget>[],
    );
  }

  Widget buildStops() => Column(
        children: [
          ...numberOfStops.entries.map((entry) {
            return RadioListTile<int>(
              title: Text(entry.key),
              value: entry.value,
              groupValue: numberOfStopsValue,
              onChanged: (value) {
                setState(() {
                  numberOfStopsValue = value!;
                });
              },
            );
          }),
          Row(
            children: [
              TextButton(
                child: const Text('Apply Filters'),
                onPressed: () {
                  final cubit = context.read<FlightCubit>();
                  // Here, you can handle the filters (e.g., pass to a function to fetch flights)
                  // cubit.filterFlights(
                  //     flights: cubit.flightsearchmodel,
                  //     arrivalTime: arrivalTimeValue,
                  //     depatureTime: depatureTimeValue,
                  //     stopsnumber: numberOfStopsValue + 1,
                  //     maxPrice: priceRange.end.round(),
                  //     minPrice: priceRange.start.round(),
                  //     airlines: []);
                  cubit.filterByStops(
                      flights: cubit.flightsearchmodel,
                      stopsnumber: numberOfStopsValue + 1);
                  Navigator.of(context).pop();

                  if (cubit.state is FlightFilter) {
                    Navigator.of(context).pop();
                  }
                },
              ),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      );

  Widget buildPriceRange() {
    return Column(children: [
      RangeSlider(
        values: priceRange,
        min: 1000,
        max: 30000,
        divisions: 10,
        labels: RangeLabels(
          '\$${priceRange.start.round()}',
          '\$${priceRange.end.round()}',
        ),
        onChanged: (RangeValues values) {
          setState(() {
            priceRange = values;
          });
        },
      ),
      Row(
        children: [
          TextButton(
            child: const Text('Apply Filters'),
            onPressed: () {
              final cubit = context.read<FlightCubit>();
              // Here, you can handle the filters (e.g., pass to a function to fetch flights)
              // cubit.filterFlights(
              //     flights: cubit.flightsearchmodel,
              //     arrivalTime: arrivalTimeValue,
              //     depatureTime: depatureTimeValue,
              //     stopsnumber: numberOfStopsValue + 1,
              //     maxPrice: priceRange.end.round(),
              //     minPrice: priceRange.start.round(),
              //     airlines: []);
              cubit.filterByPrice(
                flights: cubit.flightsearchmodel,
                maxPrice: priceRange.end.round(),
                minPrice: priceRange.start.round(),
              );
              Navigator.of(context).pop();

              if (cubit.state is FlightFilter) {
                Navigator.of(context).pop();
              }
            },
          ),
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      )
    ]);
  }

  Widget buildDepatureTime() => Column(
        children: [
          const Text('Select Depature Time:'),
          const Divider(),
          ...depatureTime.entries.map((entry) {
            return RadioListTile<String>(
              title: Text(entry.key),
              value: entry.value,
              groupValue: depatureTimeValue,
              onChanged: (value) {
                setState(() {
                  depatureTimeValue = value ?? 'Before';
                });
              },
            );
          }),
          Row(
            children: [
              TextButton(
                child: const Text('Apply Filters'),
                onPressed: () {
                  final cubit = context.read<FlightCubit>();
                  cubit.filterByDepatureTime(
                    flights: cubit.flightsearchmodel,
                    depatureTime: depatureTimeValue,
                  );
                  Navigator.of(context).pop();

                  if (cubit.state is FlightFilter) {
                    Navigator.of(context).pop();
                  }
                },
              ),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      );

  Widget buildArrivalTime() => Column(
        children: [
          const Text('Select Arrival Time:'),
          const Divider(),
          ...arrivalTime.entries.map((entry) {
            return RadioListTile<String>(
              title: Text(entry.key),
              value: entry.value,
              groupValue: arrivalTimeValue,
              onChanged: (value) {
                setState(() {
                  arrivalTimeValue = value ?? 'Before';
                });
              },
            );
          }),
          Row(
            children: [
              TextButton(
                child: const Text('Apply Filters'),
                onPressed: () {
                  final cubit = context.read<FlightCubit>();

                  cubit.filterByArrivalTime(
                    flights: cubit.flightsearchmodel,
                    arrivalTime: arrivalTimeValue,
                  );
                  Navigator.of(context).pop();

                  if (cubit.state is FlightFilter) {
                    Navigator.of(context).pop();
                  }
                },
              ),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      );

  Widget buildFilterAll() {
    return Row(
      children: [
        TextButton(
          child: const Text('Apply Filters'),
          onPressed: () {
            final cubit = context.read<FlightCubit>();

            ///  Here, you can handle the filters (e.g., pass to a function to fetch flights)
            cubit.filterFlights(
                flights: cubit.flightsearchmodel,
                arrivalTime: arrivalTimeValue,
                depatureTime: depatureTimeValue,
                stopsnumber: numberOfStopsValue + 1,
                maxPrice: priceRange.end.round(),
                minPrice: priceRange.start.round(),
                airlines: []);
            Navigator.of(context).pop();

            if (cubit.state is FlightFilter) {
              Navigator.of(context).pop();
            }
          },
        ),
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
