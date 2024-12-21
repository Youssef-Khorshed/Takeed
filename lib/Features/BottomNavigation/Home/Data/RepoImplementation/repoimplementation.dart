import 'package:dio/dio.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/DataSource/flightremote.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/ariportsModel.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/create_flight_order.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flight_offer_from_pricing/flight_offer_from_pricing.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/get_flight_offers/get_flight_offers.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/traveller/traveller.dart';
import 'package:takeed/core/Error/either.dart';
import 'package:takeed/core/Error/failure.dart';

class FlightsRepositoryImplementation {
  FlightsRemote flightsRemote;
  FlightsRepositoryImplementation({required this.flightsRemote});

  Future<FetchResult<Ariportsmodel, Failure>> fetchAirplanesSuggestions(
      {required String keyword}) async {
    final res = await flightsRemote.fetchAirplanesSuggestions(keyword: keyword);
    return res.fold((onSuccess) => FetchResult.success(onSuccess),
        (onError) => FetchResult.error(onError));
  }

  Future<FetchResult<FlightOfferFromPricing, Failure>>
      createFlightOfferFromPricing(
          {required GetFlightOffers flightoffer}) async {
    final res = await flightsRemote.createFlightOfferFromPricing(
        flightoffer: flightoffer);
    return res.fold((onSuccess) => FetchResult.success(onSuccess),
        (onError) => FetchResult.error(onError));
  }

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
  }

  Future<FetchResult<CreateFlightOrder, String>> createFlightOrder(
      {required FlightOfferFromPricing flightRequest,
      required List<Traveller> travelers}) async {
    try {
      final res = await flightsRemote.createFlightOrder(
        flightRequest: flightRequest,
        travelers: travelers,
      );

      return res.fold((onSuccess) => FetchResult.success(onSuccess),
          (onError) => FetchResult.error(onError));
    } on DioException catch (e) {
      return FetchResult.error(e.toString());
    }
  }
}
