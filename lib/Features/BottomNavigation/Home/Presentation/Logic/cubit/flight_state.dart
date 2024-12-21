part of 'flight_cubit.dart';

abstract class FlightState {}

class FlightInitial extends FlightState {}

class FlightLoading extends FlightState {}

class GetTravelerCount extends FlightState {}

class IncrementTravelerCount extends FlightState {}

class DecrementTravelerCount extends FlightState {}

class SetClassType extends FlightState {}

class SetAirport extends FlightState {}

class FilterSearch extends FlightState {}

class LoadingText extends FlightState {}

class GetSearchedFlightsResult extends FlightState {
  List<GetFlightOffers> flightsearchmodel;
  GetSearchedFlightsResult({required this.flightsearchmodel});
}

class GetFlightOfferFromPricingResult extends FlightState {}

class GetFromAirportsResult extends FlightState {
  List<AirportData> ariportsmodel;
  GetFromAirportsResult({required this.ariportsmodel});
}

class GetToAirportsResult extends FlightState {
  List<AirportData> ariportsmodel;
  GetToAirportsResult({required this.ariportsmodel});
}

class ClearList extends FlightState {}

class SelectDepartureDate extends FlightState {
  bool pickeddate = false;
  DateTime date;

  SelectDepartureDate({required this.pickeddate, required this.date});
}

class SelectReturnDate extends FlightState {
  bool pickeddate = false;
  DateTime date;

  SelectReturnDate({required this.pickeddate, required this.date});
}

class GetFlightOrderResult extends FlightState {
  CreateFlightOrder flight;
  GetFlightOrderResult({required this.flight});
}

class FlightError extends FlightState {
  final String error;
  FlightError({required this.error});
}
