import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flight_offer_from_pricing/flight_offer_from_pricing.dart';
import 'package:takeed/Features/Flight/FlightSearchResult/FlightSearchResultCard.dart';
import 'package:takeed/components/text_box/text_box.dart';

// ignore: must_be_immutable
class Flightdatetime extends StatelessWidget {
  FlightOfferFromPricing flightSearchData;

  Flightdatetime({super.key, required this.flightSearchData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MyTextBox(
            prefixIcon: const Icon(Icons.calendar_today),
            readonly: false,
            labelText: getDateTravel().toString(),
            hintText: 'hintText',
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: MyTextBox(
            prefixIcon: const Icon(Icons.timer_outlined),
            readonly: false,
            labelText: getTravelTime(getDepartureTime(), getArrivalTime()),
            hintText: 'hintText',
          ),
        ),
      ],
    );
  }

  String getDepartureTime() => FlightCard.getTime(
      time: flightSearchData.flightOffers!.first.itineraries!.first.segments!
          .first.departure!.at!);

  String getArrivalTime() => FlightCard.getTime(
      time: flightSearchData
          .flightOffers!.first.itineraries!.first.segments!.first.arrival!.at!);

  String getTravelTime(String time1, String time2) {
    List<int> time1Components = parseTime(time1);
    List<int> time2Components = parseTime(time2);

    int totalMinutes1 = time1Components[0] * 60 + time1Components[1];
    int totalMinutes2 = time2Components[0] * 60 + time2Components[1];

    int differenceInMinutes = (totalMinutes1 - totalMinutes2).abs();

    int hours = differenceInMinutes ~/ 60;
    int minutes = differenceInMinutes % 60;

    if (hours > 0) {
      return '$hours H $minutes m';
    } else {
      return '$minutes m';
    }
  }

  List<int> parseTime(String time) {
    List<String> parts = time.split(":");
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    return [hours, minutes];
  }

  String getDateTravel() {
    return FlightCard.getDate(
        time: flightSearchData.flightOffers!.first.itineraries!.first.segments!
            .first.arrival!.at!);
  }
}
