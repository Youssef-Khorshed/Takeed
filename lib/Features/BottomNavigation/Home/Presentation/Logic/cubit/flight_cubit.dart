import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:takeed/Features/Flight/FlightSearchResult/FlightSearchResultCard.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/ariportsModel.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flghtRequestModel.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flightSearchModel.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/RepoImplementation/repoimplementation.dart';
part 'flight_state.dart';

class FlightCubit extends Cubit<FlightState> {
  final formKey = GlobalKey<FormState>();
  FlightsRepositoryImplementation flightsRepositoryImplementation;
  TextEditingController fromCityController = TextEditingController();
  TextEditingController toCityController = TextEditingController();

  List<AirportData> fromairports = [];
  List<AirportData> toAirports = [];
  List<String> currencyCode = ['SAR', 'USD'];
  AirportData fromairport = AirportData();
  AirportData toairport = AirportData();
  DateTime departureDate = DateTime.now();
  bool pickdepartureDateFirstTime = false;
  bool pickReturnDateFirstTime = false;
  DateTime? returnDate;
  Flightsearchmodel flightsearchmodel = Flightsearchmodel();
  String classType = 'Economy';
  Map<String, int> getTravelersCount = {
    'Adults': 0,
    'Children': 0,
    'Infants': 0
  };
  List<FlightSearchData> filterList = [];
  FlightCubit({required this.flightsRepositoryImplementation})
      : super(FlightInitial());

  void fetchAirplanesFromSuggestions({required String keyword}) async {
    Timer(const Duration(milliseconds: 500), () async {
      if (keyword.isNotEmpty) {
        emit(LoadingText());
        final result = await flightsRepositoryImplementation
            .fetchAirplanesSuggestions(keyword: keyword);
        result.fold((r) {
          if (r.data!.isNotEmpty) {
            fromairports = r.data!;
          }
          emit(GetFromAirportsResult(ariportsmodel: fromairports));
        }, (onError) => emit(FlightError(error: onError.message)));
      } else {
        clearlist(airportType: fromairports);
      }
    });
  }

  void fetchAirplanesToSuggestions({required String keyword}) async {
    Timer(const Duration(milliseconds: 500), () async {
      if (keyword.isNotEmpty) {
        emit(LoadingText());
        final result = await flightsRepositoryImplementation
            .fetchAirplanesSuggestions(keyword: keyword);
        result.fold((onSuccess) {
          toAirports = onSuccess.data!;
          emit(GetToAirportsResult(ariportsmodel: toAirports));
        }, (onError) => emit(FlightError(error: onError.message)));
      } else {
        clearlist(airportType: toAirports);
      }
    });
  }

  void clearlist({required List<AirportData> airportType}) {
    airportType.clear();
    emit(ClearList());
  }

  void setAirport(
      {required AirportData airport, required List<AirportData> airportType}) {
    if (airportType == fromairports) {
      fromairport = airport;
    } else {
      toairport = airport;
    }
    emit(SetAirport());
  }

  void setClassType({required String type}) {
    classType = type;
    emit(SetClassType());
  }

  void incrementTravelrCount({required String label}) {
    getTravelersCount[label] = getTravelersCount[label]! + 1;
    emit(IncrementTravelerCount());
  }

  void decrementTravelrCount({required String label}) {
    if (getTravelersCount[label]! > 0) {
      getTravelersCount[label] = getTravelersCount[label]! - 1;
      emit(DecrementTravelerCount());
    }
  }

  Future<void> createFlightOrder(
      {required FlightRequest flightRequest,
      required List<Travelers> travelers,
      required Remarks remarks,
      required List<Contacts> contacts,
      required TicketingAgreement ticketingAgreement}) async {
    emit(FlightLoading());
    final result = await flightsRepositoryImplementation.createFlightOrder(
        flightRequest: flightRequest,
        travelers: travelers,
        remarks: remarks,
        contacts: contacts,
        ticketingAgreement: ticketingAgreement);
    result.fold((r) => emit(GetFlightOrderResult()),
        (l) => emit(FlightError(error: l.message)));
  }

  Future<void> getSearchedFlights(
      {required String originLocationCode,
      required String destinationLocationCode,
      required String departureDate,
      required String returnDate,
      required String adults,
      required String currencyCode,
      required String children,
      required String infants,
      required String max}) async {
    emit(FlightLoading());
    final result = await flightsRepositoryImplementation.getSearchedFlights(
        originLocationCode: originLocationCode,
        destinationLocationCode: destinationLocationCode,
        departureDate: departureDate,
        returnDate: returnDate,
        adults: adults,
        currencyCode: currencyCode,
        children: children,
        infants: infants,
        max: max);
    result.fold((onSuccess) {
      flightsearchmodel = onSuccess;
      emit(GetSearchedFlightsResult(flightsearchmodel: flightsearchmodel));
    }, (onError) {
      debugPrint(onError.message.toString());
      emit(FlightError(error: onError.message));
    });
  }

  Future<void> selectDate(BuildContext context,
      {required bool isDeparture}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: isDeparture ? departureDate : returnDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      if (isDeparture) {
        departureDate = pickedDate;
        pickdepartureDateFirstTime = true;
        emit(SelectDepartureDate(
            pickeddate: pickReturnDateFirstTime, date: departureDate));
      } else {
        returnDate = pickedDate;
        pickReturnDateFirstTime = true;
        emit(SelectReturnDate(
            pickeddate: pickReturnDateFirstTime, date: returnDate!));
      }
    }
  }

  int countTravelers() {
    final x = getTravelersCount['Adults'] ?? 0;
    final y = getTravelersCount['Children'] ?? 0;
    final z = getTravelersCount['Infants'] ?? 0;
    return x + y + z;
  }

  filterFlights(
      {required List<FlightSearchData> flights,
      required int stopsnumber,
      required int maxPrice,
      required int minPrice,
      required String arrivalTime, // code  -> flightName
      required String depatureTime,
      required List<String> airlines}) {
    filterList = flights.where((flight) {
      filterList.clear();

      final itinerary = flight.itineraries!.first;
      final segment = itinerary.segments!;
      // 0  - 1
      final flightPrice = int.parse(flight.price!.grandTotal!);
      final matchstops = segment.length == stopsnumber;

      final matchprice = flightPrice >= minPrice && flightPrice <= maxPrice;
      final matcharrivalTime = compareTimeAgainstRanges(
          FlightCard.getTime(time: segment.last.arrival!.at ?? ''),
          arrivalTime);

      final matchdepatureTime = compareTimeAgainstRanges(
          FlightCard.getTime(time: segment.first.departure!.at ?? ''),
          depatureTime);
      // final matchairline = airlines.isEmpty ||
      //     airlines
      //         .contains(segment.first.carrierCode) || // for depature airlines
      //     airlines.contains(segment.last.carrierCode); // for arrival airlines
      return matchstops && matchprice && matcharrivalTime && matchdepatureTime
          //  && matchairline
          ;
    }).toList();
    print(filterList.length);

    emit(FilterSearch());
  }

  filterByPrice({
    required List<FlightSearchData> flights,
    required int maxPrice,
    required int minPrice,
  }) {
    filterList.clear();
    filterList = flights.where((flight) {
      final flightPrice = int.parse(flight.price!.grandTotal!);
      final matchprice = flightPrice >= minPrice && flightPrice <= maxPrice;
      return matchprice;
    }).toList();
    print(filterList.length);

    emit(FilterSearch());
  }

  filterByArrivalTime({
    required List<FlightSearchData> flights,
    required String arrivalTime,
  }) {
    filterList.clear();

    filterList = flights.where((flight) {
      final itinerary = flight.itineraries!.first;
      final segment = itinerary.segments!;
      final matcharrivalTime = compareTimeAgainstRanges(
          FlightCard.getTime(time: segment.last.arrival!.at ?? ''),
          arrivalTime);
      return matcharrivalTime;
    }).toList();
    print(filterList.length);

    emit(FilterSearch());
  }

  filterByDepatureTime({
    required List<FlightSearchData> flights,
    required String depatureTime,
  }) {
    filterList = flights.where((flight) {
      final itinerary = flight.itineraries!.first;
      final segment = itinerary.segments!;
      final matchDepature = compareTimeAgainstRanges(
          FlightCard.getTime(time: segment.first.departure!.at ?? ''),
          depatureTime);
      return matchDepature;
    }).toList();
    print(filterList.length);

    emit(FilterSearch());
  }

  filterByStops({
    required List<FlightSearchData> flights,
    required int stopsnumber,
  }) {
    filterList.clear();

    filterList = flights.where((flight) {
      final itinerary = flight.itineraries!.first;
      final segment = itinerary.segments!;
      final matchstops = segment.length == stopsnumber;
      return matchstops;
    }).toList();
    print(filterList.length);
    emit(FilterSearch());
  }

  // Compare the two times
  bool compareTimeAgainstRanges(String timeIn24Hour, String arrivalTime) {
    if (arrivalTime.contains('Before')) {
      if (timeIn24Hour.compareTo('06:00') < 0) {
        return true;
      }
    } else if (arrivalTime.contains('Between')) {
      if (timeIn24Hour.compareTo('06:00') >= 0 &&
          timeIn24Hour.compareTo(arrivalTime) < 0) {
        return true;
      }
    } else if (arrivalTime.contains('After 12:00 PM')) {
      if (timeIn24Hour.compareTo('12:00') >= 0 &&
          timeIn24Hour.compareTo(arrivalTime) < 0) {
        return true;
      }
    } else if (arrivalTime.contains('After 6:00 PM')) {
      if (timeIn24Hour.compareTo('18:00') >= 0) {
        return true;
      }
    }

    return false; // Return the last key if none of the conditions are met
  }
}
