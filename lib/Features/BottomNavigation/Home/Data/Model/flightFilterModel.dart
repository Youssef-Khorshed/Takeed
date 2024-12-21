import 'package:takeed/Features/BottomNavigation/Home/Data/Model/get_flight_offers/get_flight_offers.dart';

class FlightFilter {
  final String? airlineLogo; // Optional: URL or path for the airline logo
  final String airlineName; // Required: Name of the airline
  final String flightNumber; // Required: Flight number
  final DateTime departureTime; // Required: Departure time (ISO 8601 format)
  final DateTime arrivalTime; // Required: Arrival time (ISO 8601 format)
  final String duration; // Required: Duration of the flight
  final String departureAirport; // Required: IATA code for departure airport
  final String arrivalAirport; // Required: IATA code for arrival airport
  final int price; // Required: Price of the flight

  // Constructor for the Flight class
  FlightFilter({
    this.airlineLogo,
    required this.airlineName,
    required this.flightNumber,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.departureAirport,
    required this.arrivalAirport,
    required this.price,
  });

  factory FlightFilter.fromJson(GetFlightOffers flight) {
    final itinerary = flight.itineraries!.first;
    final segment = itinerary.segments!.first;
    return FlightFilter(
      airlineLogo: segment.carrierCode, // Placeholder for logo
      airlineName: segment.carrierCode ??
          '', // You can map this to the actual name if needed
      flightNumber: segment.number ?? '',
      departureTime: DateTime.parse(segment.departure!.at ?? ''),
      arrivalTime: DateTime.parse(segment.arrival!.at ?? ''),
      duration: segment.duration ?? '',
      departureAirport: segment.departure!.iataCode ?? '',
      arrivalAirport: segment.arrival!.iataCode ?? '',
      price: int.parse(flight.price!.total ?? ''),
    );
  }
}
