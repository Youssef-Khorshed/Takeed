import 'package:dartz/dartz.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/DataSource/flightRemoteAbstract.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/ariportsModel.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/address.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/create_flight_order.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flight_offer_from_pricing/flight_offer_from_pricing.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/get_flight_offers/get_flight_offers.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/traveller/traveller.dart';

class FlightsRepositoryImplementation {
  FlightsRemote flightsRemote;
  FlightsRepositoryImplementation({required this.flightsRemote});

  Future<Either<String, Ariportsmodel>> fetchAirplanesSuggestions(
      {required String keyword}) async {
    final res = await flightsRemote.fetchAirplanesSuggestions(keyword: keyword);
    return res.fold((ifLeft) => Left(ifLeft), (ifRight) => Right(ifRight));
  }

  Future<Either<String, FlightOfferFromPricing>> createFlightOfferFromPricing(
      {required GetFlightOffers flightoffer}) async {
    final res = await flightsRemote.createFlightOfferFromPricing(
        flightoffer: flightoffer);
    return res.fold((ifLeft) => Left(ifLeft), (ifRight) => Right(ifRight));
  }

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

    return res.fold((ifLeft) => Left(ifLeft), (ifRight) => Right(ifRight));
  }

  Future<Either<String, CreateFlightOrder>> createFlightOrder({
    required FlightOfferFromPricing flightRequest,
    required List<Traveller> travelers,
    required Address address,
  }) async {
    final res = await flightsRemote.createFlightOrder(
      flightRequest: flightRequest,
      travelers: travelers,
      address: address,
    );
    return res.fold((ifLeft) => Left(ifLeft), (ifRight) => Right(ifRight));
  }
}
