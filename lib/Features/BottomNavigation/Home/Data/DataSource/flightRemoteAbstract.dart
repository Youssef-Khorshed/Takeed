import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/ariportsModel.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/address.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/flight_offer_from_pricing/flight_offer_from_pricing.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/create_flight_order/create_flight_order.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/get_flight_offers/get_flight_offers.dart';
import 'package:takeed/Features/BottomNavigation/Home/Data/Model/traveller/traveller.dart';

abstract class FlightsRemote {
  Future<Either<String, Ariportsmodel>> fetchAirplanesSuggestions(
      {required String keyword});
  Future<Either<String, List<GetFlightOffers>>> getSearchedFlights(
      {required String originLocationCode,
      required String destinationLocationCode,
      required String departureDate,
      required String returnDate,
      required String adults,
      required String currencyCode,
      required String children,
      required String infants,
      required String max});

  Future<Either<String, CreateFlightOrder>> createFlightOrder({
    required FlightOfferFromPricing flightRequest,
    required List<Traveller> travelers,
    required Address address,
  });

  Future<Either<String, FlightOfferFromPricing>> createFlightOfferFromPricing({
    required GetFlightOffers flightoffer,
  });

  Future<Either<String, Response>> confirmFlightPayment({
    required String reservationGUID,
    required String payemntId,
  });
}
