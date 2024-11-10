import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/ariportsModel.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flghtRequestModel.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flightSearchModel.dart';
import 'package:takeed/core/Error/appException.dart';
import 'package:takeed/core/Error/either.dart';
import 'package:takeed/core/Strings/appStrings.dart';
import 'package:http/http.dart' as http;

abstract class FlightsRemote {
  Future<Ariportsmodel> fetchAirplanesSuggestions({required String keyword});
  Future<FetchResult<Flightsearchmodel, AppException>> getSearchedFlights(
      {required String originLocationCode,
      required String destinationLocationCode,
      required String departureDate,
      required String returnDate,
      required String adults,
      required String currencyCode,
      required String children,
      required String infants,
      required String max});

  Future<FlightRequest> createFlightOrder(
      {required FlightRequest flightRequest,
      required List<Travelers> travelers,
      required Remarks remarks,
      required List<Contacts> contacts,
      required TicketingAgreement ticketingAgreement});
}

class FlightsRemoteImplementation implements FlightsRemote {
  Dio dio;
  FlightsRemoteImplementation({required this.dio});
  @override
  Future<Ariportsmodel> fetchAirplanesSuggestions(
      {required String keyword}) async {
    final res = await http
        .get(Uri.parse(Appstrings.airPortsSuggestions(keyword: keyword)));
    return Ariportsmodel.fromJson(jsonDecode(res.body));
  }

  @override
  Future<FetchResult<Flightsearchmodel, AppException>> getSearchedFlights(
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
      http.Response res = await http.get(Uri.parse(Appstrings.searchFlights(
          originLocationCode: originLocationCode,
          departureDate: departureDate,
          destinationLocationCode: destinationLocationCode,
          returnDate: returnDate,
          adults: adults,
          currencyCode: currencyCode,
          children: children,
          infants: infants,
          max: max)));
      if (res.statusCode != 200) {
        return FetchResult.error(handleStatuscode(response: res));
      }
      return FetchResult.success(
          Flightsearchmodel.fromJson(jsonDecode(res.body)));
    } on Exception catch (e) {
      return FetchResult.error(handleException(e));
    }
  }

  @override
  Future<FlightRequest> createFlightOrder(
      {required FlightRequest flightRequest,
      required List<Travelers> travelers,
      required Remarks remarks,
      required List<Contacts> contacts,
      required TicketingAgreement ticketingAgreement}) async {
    final res = await dio.post(Appstrings.createFilghtUrl,
        queryParameters: Appstrings.createFilghtParameters(
            flightRequest: flightRequest,
            travelers: travelers,
            remarks: remarks,
            contacts: contacts,
            ticketingAgreement: ticketingAgreement));

    return FlightRequest.fromJson(res.data);
  }
}
