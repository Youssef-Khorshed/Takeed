import 'package:takeed/Features/BottomNavigation/Home/Data/DataSource/flightremote.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/ariportsModel.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flghtRequestModel.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flightSearchModel.dart';
import 'package:takeed/core/Error/appException.dart';
import 'package:takeed/core/Error/either.dart';

class FlightsRepositoryImplementation {
  FlightsRemote flightsRemote;
  FlightsRepositoryImplementation({required this.flightsRemote});

  Future<FetchResult<Ariportsmodel, AppException>> fetchAirplanesSuggestions(
      {required String keyword}) async {
    try {
      final res =
          await flightsRemote.fetchAirplanesSuggestions(keyword: keyword);
      return FetchResult.success(res);
    } on Exception catch (error) {
      return FetchResult.error(handleException(error));
    }
  }

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
      final res = await flightsRemote.getSearchedFlights(
          originLocationCode: originLocationCode,
          departureDate: departureDate,
          destinationLocationCode: destinationLocationCode,
          returnDate: returnDate,
          adults: adults,
          currencyCode: currencyCode,
          children: children,
          infants: infants,
          max: max);

      return res.fold((onSuccess) => FetchResult.success(onSuccess),
          (onError) => FetchResult.error(onError));
    } on Exception catch (error) {
      return FetchResult.error(handleException(error));
    }
  }

  Future<FetchResult<FlightRequest, AppException>> createFlightOrder(
      {required FlightRequest flightRequest,
      required List<Travelers> travelers,
      required Remarks remarks,
      required List<Contacts> contacts,
      required TicketingAgreement ticketingAgreement}) async {
    try {
      final res = await flightsRemote.createFlightOrder(
          flightRequest: flightRequest,
          travelers: travelers,
          remarks: remarks,
          contacts: contacts,
          ticketingAgreement: ticketingAgreement);
      return FetchResult.success(res);
    } on Exception catch (error) {
      return FetchResult.error(handleException(error));
    }
  }
}
