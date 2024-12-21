import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/ariportsModel.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/create_flight_order.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flight_offer_from_pricing/flight_offer_from_pricing.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/get_flight_offers/get_flight_offers.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/traveller/traveller.dart';
import 'package:takeed/core/Error/appException.dart';
import 'package:takeed/core/Error/either.dart';
import 'package:takeed/core/Error/exception.dart';
import 'package:takeed/core/Error/failure.dart';
import 'package:takeed/core/Error/internet.dart';
import 'package:takeed/core/NetworkInfo/dio.dart';
import 'package:takeed/core/Strings/appStrings.dart';
import 'package:http/http.dart' as http;

abstract class FlightsRemote {
  Future<FetchResult<Ariportsmodel, Failure>> fetchAirplanesSuggestions(
      {required String keyword});
  Future<FetchResult<List<GetFlightOffers>, Failure>> getSearchedFlights(
      {required String originLocationCode,
      required String destinationLocationCode,
      required String departureDate,
      required String returnDate,
      required String adults,
      required String currencyCode,
      required String children,
      required String infants,
      required String max});

  Future<FetchResult<CreateFlightOrder, String>> createFlightOrder({
    required FlightOfferFromPricing flightRequest,
    required List<Traveller> travelers,
  });

  Future<FetchResult<FlightOfferFromPricing, Failure>>
      createFlightOfferFromPricing({
    required GetFlightOffers flightoffer,
  });
}

class FlightsRemoteImplementation implements FlightsRemote {
  Dio dio;
  ApiService apiService = ApiService(
      internetConnectivity: MobileConnectivity(connectivity: Connectivity()));
  FlightsRemoteImplementation({required this.dio});
  @override
  Future<FetchResult<Ariportsmodel, Failure>> fetchAirplanesSuggestions(
      {required String keyword}) async {
    try {
      final res = await apiService
          .getRequest(Appstrings.airPortsSuggestions(keyword: keyword));

      return FetchResult.success(Ariportsmodel.fromJson(res));
    } on NoInternetException {
      return FetchResult.error(
          InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return FetchResult.error(
          InternetConnectionFailure(message: e.message.toString()));
    }
  }

  @override
  Future<FetchResult<List<GetFlightOffers>, Failure>> getSearchedFlights(
      {required String originLocationCode,
      required String destinationLocationCode,
      required String departureDate,
      required String returnDate,
      required String adults,
      required String currencyCode,
      required String children,
      required String infants,
      required String max}) async {
    try {
      final res = await apiService.getRequest(Appstrings.searchFlights(
          originLocationCode: originLocationCode,
          departureDate: departureDate,
          destinationLocationCode: destinationLocationCode,
          returnDate: returnDate,
          adults: adults,
          currencyCode: currencyCode,
          children: children,
          infants: infants,
          max: max));

      final List<dynamic> flights = res['tayarResult']['data'];
      final List<GetFlightOffers> flightOffers =
          flights.map((flight) => GetFlightOffers.fromJson(flight)).toList();
      return FetchResult.success(flightOffers);
    } on NoInternetException {
      return FetchResult.error(
          InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return FetchResult.error(
          InternetConnectionFailure(message: e.message.toString()));
    }
  }

  @override
  Future<FetchResult<CreateFlightOrder, String>> createFlightOrder({
    required FlightOfferFromPricing flightRequest,
    required List<Traveller> travelers,
  }) async {
    // try {
    //   final res = await http.post(Uri.parse(Appstrings.createFilghordertUrl),
    //       body: Appstrings.createFilghtBody(
    //         flightRequest: flightRequest,
    //         travelers: travelers,
    //       ));
    //   if (res.statusCode != 200 || res.statusCode != 201) {
    //     return FetchResult.error(handleStatuscode(response: res));
    //   }

    //   final data = jsonDecode(res.body)['tayarResult']['data'];

    //   return FetchResult.success(CreateFlightOrder.fromJson(data));
    // } on Exception catch (e) {
    //   return FetchResult.error(handleException(e));
    // }

    try {
      final res = await apiService.postRequest(Appstrings.createFilghordertUrl,
          body: Appstrings.createFilghtBody(
              flightRequest: flightRequest, travelers: travelers));

      final data = res['tayarResult']['data'];

      return FetchResult.success(CreateFlightOrder.fromJson(data));
    } on NoInternetException {
      return FetchResult.error(
          InternetConnectionFailure(message: 'No internet Connection').message);
    } on ServerException catch (e) {
      return FetchResult.error(
          InternetConnectionFailure(message: e.message.toString()).message);
    } on DioException catch (e) {
      return FetchResult.error(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<FetchResult<FlightOfferFromPricing, Failure>>
      createFlightOfferFromPricing({
    required GetFlightOffers flightoffer,
  }) async {
    try {
      final res = await apiService.postRequest(Appstrings.flightOfferPricing,
          body: Appstrings.flightOfferPricingBody(flight: flightoffer));
      final data = res['tayarResult']['data']['flightOffers'][0];
      return FetchResult.success(FlightOfferFromPricing.fromJson(data));
    } on NoInternetException {
      return FetchResult.error(
          InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return FetchResult.error(
          InternetConnectionFailure(message: e.message.toString()));
    }
  }
}
