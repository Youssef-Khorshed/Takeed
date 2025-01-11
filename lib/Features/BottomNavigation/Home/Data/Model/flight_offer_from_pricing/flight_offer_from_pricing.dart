import 'booking_requirements.dart';
import 'flight_offer.dart';

class FlightOfferFromPricing {
  String? type;
  List<FlightOffer>? flightOffers;
  BookingRequirements? bookingRequirements;

  FlightOfferFromPricing({
    this.type,
    this.flightOffers,
    this.bookingRequirements,
  });

  factory FlightOfferFromPricing.fromJson(Map<String, dynamic> json) {
    return FlightOfferFromPricing(
      type: json['type'] as String?,
      flightOffers: (json['flightOffers'] as List<dynamic>?)
          ?.map((e) => FlightOffer.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookingRequirements: json['bookingRequirements'] == null
          ? null
          : BookingRequirements.fromJson(
              json['bookingRequirements'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'flightOffers': flightOffers?.map((e) => e.toJson()).toList(),
        'bookingRequirements': bookingRequirements?.toJson(),
      };
}
