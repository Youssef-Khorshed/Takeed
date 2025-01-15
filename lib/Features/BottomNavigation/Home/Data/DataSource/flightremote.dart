import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/DataSource/flightRemoteAbstract.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/ariportsModel.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/address.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/create_flight_order.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flight_offer_from_pricing/flight_offer_from_pricing.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/get_flight_offers/get_flight_offers.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/traveller/traveller.dart';
import 'package:takeed/core/Error/internet.dart';
import 'package:takeed/core/NetworkInfo/dio.dart';
import 'package:takeed/core/Strings/appStrings.dart';

class FlightsRemoteImplementation implements FlightsRemote {
  Dio dio;
  HttpFactory apiService = HttpFactory(
      internetConnectivity: MobileConnectivity(connectivity: Connectivity()));
  FlightsRemoteImplementation({required this.dio});
  @override
  Future<Either<String, Ariportsmodel>> fetchAirplanesSuggestions(
      {required String keyword}) async {
    final res = await apiService.getRequest(
        url: Appstrings.airPortsSuggestions(keyword: keyword));
    return res.fold((ifLeft) => Left(ifLeft),
        (ifRight) => Right(Ariportsmodel.fromJson(jsonDecode(ifRight.body))));
  }

  @override
  Future<Either<String, List<GetFlightOffers>>> getSearchedFlights(
      {required String originLocationCode,
      required String destinationLocationCode,
      required String departureDate,
      required String returnDate,
      required String adults,
      required String currencyCode,
      required String children,
      required String infants,
      required String max}) async {
    final res = await apiService.getRequest(
        url: Appstrings.searchFlights(
            originLocationCode: originLocationCode,
            departureDate: departureDate,
            destinationLocationCode: destinationLocationCode,
            returnDate: returnDate,
            adults: adults,
            currencyCode: currencyCode,
            children: children,
            infants: infants,
            max: max));
    return res.fold((ifLeft) => Left(ifLeft), (ifRight) {
      final List<dynamic> flights =
          jsonDecode(ifRight.body)['tayarResult']['data'];
      final List<GetFlightOffers> flightOffers =
          flights.map((flight) => GetFlightOffers.fromJson(flight)).toList();
      return Right(flightOffers);
    });
  }

  @override
  Future<Either<String, CreateFlightOrder>> createFlightOrder({
    required FlightOfferFromPricing flightRequest,
    required Address address,
    required List<Traveller> travelers,
  }) async {
    final res = await apiService.postRequest(
        url: Appstrings.createFilghordertUrl,
        body: Appstrings.createFilghtBody(
            address: address,
            flightRequest: flightRequest,
            travelers: travelers));

    return res.fold(
        (ifLeft) => Left(ifLeft),
        (ifRight) => Right(CreateFlightOrder.fromJson(
            jsonDecode(ifRight.body)['tayarResult']['data'])));
  }

  @override
  Future<Either<String, FlightOfferFromPricing>> createFlightOfferFromPricing({
    required GetFlightOffers flightoffer,
  }) async {
    final res = await apiService.postRequest(
        url: Appstrings.flightOfferPricing,
        body: Appstrings.flightOfferPricingBody(flight: flightoffer));
    return res.fold(
        (ifLeft) => Left(ifLeft),
        (ifRight) => Right(FlightOfferFromPricing.fromJson(
            jsonDecode(ifRight.body)['tayarResult']['data'])));
  }
}
