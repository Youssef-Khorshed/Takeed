import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/address.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/create_flight_order.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flight_offer_from_pricing/flight_offer_from_pricing.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/get_flight_offers/get_flight_offers.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/traveller/document.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/traveller/traveller.dart';
import 'package:takeed/Features/Flight/FlightSearchResult/FlightSearchResultCard.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/ariportsModel.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/RepoImplementation/repoimplementation.dart';
part 'flight_state.dart';

class FlightCubit extends Cubit<FlightState> {
  final formKey = GlobalKey<FormState>();
  FlightsRepositoryImplementation flightsRepositoryImplementation;
  TextEditingController fromCityController = TextEditingController();
  TextEditingController toCityController = TextEditingController();
  List<AirportData> fromairports = [];
  List<AirportData> toAirports = [];
  Address address = Address();
  Document document = Document();
  FlightOfferFromPricing flightOfferFromPricing = FlightOfferFromPricing();
  List<String> currencyCode = ['SAR', 'USD'];
  AirportData fromairport = AirportData();
  AirportData toairport = AirportData();
  DateTime departureDate = DateTime.now();
  bool pickdepartureDateFirstTime = false;
  bool pickReturnDateFirstTime = false;
  CreateFlightOrder flightOrder = CreateFlightOrder();
  DateTime? returnDate;
  List<Traveller> travellers = [];
  List<GetFlightOffers> flightsearchmodel = [];
  String classType = 'Economy';
  Map<String, int> getTravelersCount = {
    'Adults': 1,
    'Children': 0,
    'Infants': 0
  };
  List<GetFlightOffers> filterList = [];
  FlightCubit({required this.flightsRepositoryImplementation})
      : super(FlightInitial());

  void fetchAirplanesFromSuggestions({required String keyword}) async {
    Timer(const Duration(milliseconds: 500), () async {
      if (keyword.isNotEmpty) {
        emit(LoadingText());
        final result = await flightsRepositoryImplementation
            .fetchAirplanesSuggestions(keyword: keyword);
        result.fold((left) {
          emit(FlightError(error: left));
        }, (r) {
          if (r.data!.isNotEmpty) {
            fromairports = r.data!;
          }
          emit(GetFromAirportsResult(ariportsmodel: fromairports));
        });
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
        result.fold((left) {
          emit(FlightError(error: left));
        }, (r) {
          toAirports = r.data!;
          emit(GetToAirportsResult(ariportsmodel: toAirports));
        });
      } else {
        clearlist(airportType: toAirports);
      }
    });
  }

  void clearlist({required List<AirportData> airportType}) {
    airportType.clear();
    emit(ClearList());
  }

  void addTravellerAddress({required Address travelleraddress}) {
    address = travelleraddress;
    emit(AddTravellerAddress(travelleraddress: address));
  }

  void addTraveller({required Traveller traveller}) {
    travellers.add(traveller);
    emit(AddTraveller(traveller: traveller));
  }

  void addTravellerDocument({required Document travellerdocument}) {
    document = travellerdocument;
    emit(AddTravellerDocument(document: document));
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

  Future<void> createFlightOrder({
    required FlightOfferFromPricing flightRequest,
    required List<Traveller> travelers,
    required Address address,
  }) async {
    emit(FlightLoading());
    final result = await flightsRepositoryImplementation.createFlightOrder(
        flightRequest: flightRequest, travelers: travelers, address: address);
    result.fold((left) {
      emit(CreateFlightorderError(message: left));
    }, (r) {
      flightOrder = r;
      emit(GetFlightOrderResult(flight: flightOrder));
    });
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
    result.fold((left) {
      emit(FlightError(error: left));
    }, (r) {
      flightsearchmodel = r;
      emit(GetSearchedFlightsResult(flightsearchmodel: flightsearchmodel));
    });
  }

  Future<void> createFlightOfferFromPricing(
      {required GetFlightOffers flightoffer}) async {
    emit(GetFlightOfferFromPricingLoading());
    final res = await flightsRepositoryImplementation
        .createFlightOfferFromPricing(flightoffer: flightoffer);
    res.fold((left) {
      emit(GetFlightOfferFromPricingError(error: left));
    }, (r) {
      flightOfferFromPricing = r;

      emit(GetFlightOfferFromPricingResult(flightOfferFromPricing: r));
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
      {required List<GetFlightOffers> flights,
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

      return matchstops && matchprice && matcharrivalTime && matchdepatureTime;
    }).toList();

    emit(FilterSearch());
  }

  filterByPrice({
    required List<GetFlightOffers> flights,
    required int maxPrice,
    required int minPrice,
  }) {
    filterList.clear();
    filterList = flights.where((flight) {
      String input = flight.price!.grandTotal!.replaceAll(',', '.');
      final flightPrice = double.parse(input);
      final matchprice = flightPrice >= minPrice && flightPrice <= maxPrice;
      return matchprice;
    }).toList();

    emit(FilterSearch());
  }

  filterByArrivalTime({
    required List<GetFlightOffers> flights,
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

    emit(FilterSearch());
  }

  filterByDepatureTime({
    required List<GetFlightOffers> flights,
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

    emit(FilterSearch());
  }

  filterByStops({
    required List<GetFlightOffers> flights,
    required int stopsnumber,
  }) {
    filterList.clear();

    filterList = flights.where((flight) {
      final itinerary = flight.itineraries!.first;
      final segment = itinerary.segments!;
      final matchstops = segment.length == stopsnumber;
      return matchstops;
    }).toList();
    emit(FilterSearch());
  }

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

    return false;
  }
}
