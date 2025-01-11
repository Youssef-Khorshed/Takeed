import 'itinerary.dart';
import 'price.dart';
import 'pricing_options.dart';
import 'traveler_pricing.dart';

class FlightOffer {
  String? type;
  String? id;
  String? source;
  bool? instantTicketingRequired;
  bool? nonHomogeneous;
  bool? oneWay;
  String? lastTicketingDate;
  int? numberOfBookableSeats;
  List<Itinerary>? itineraries;
  Price? price;
  PricingOptions? pricingOptions;
  List<String>? validatingAirlineCodes;
  List<TravelerPricing>? travelerPricings;

  FlightOffer({
    this.type,
    this.id,
    this.source,
    this.instantTicketingRequired,
    this.nonHomogeneous,
    this.oneWay,
    this.lastTicketingDate,
    this.numberOfBookableSeats,
    this.itineraries,
    this.price,
    this.pricingOptions,
    this.validatingAirlineCodes,
    this.travelerPricings,
  });

  factory FlightOffer.fromJson(Map<String, dynamic> json) => FlightOffer(
        type: json['type'] as String?,
        id: json['id'] as String?,
        source: json['source'] as String?,
        instantTicketingRequired: json['instantTicketingRequired'] as bool?,
        nonHomogeneous: json['nonHomogeneous'] as bool?,
        oneWay: json['oneWay'] as bool?,
        lastTicketingDate: json['lastTicketingDate'] as String?,
        numberOfBookableSeats: json['numberOfBookableSeats'] as int?,
        itineraries: (json['itineraries'] as List<dynamic>?)
            ?.map((e) => Itinerary.fromJson(e as Map<String, dynamic>))
            .toList(),
        price: json['price'] == null
            ? null
            : Price.fromJson(json['price'] as Map<String, dynamic>),
        pricingOptions: json['pricingOptions'] == null
            ? null
            : PricingOptions.fromJson(
                json['pricingOptions'] as Map<String, dynamic>),
        validatingAirlineCodes:
            (json['validatingAirlineCodes'] as List<dynamic>?)
                ?.map((toElement) => toElement.toString())
                .toList(),
        travelerPricings: (json['travelerPricings'] as List<dynamic>?)
            ?.map((e) => TravelerPricing.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'id': id,
        'source': source,
        'instantTicketingRequired': instantTicketingRequired,
        'nonHomogeneous': nonHomogeneous,
        'oneWay': oneWay,
        'lastTicketingDate': lastTicketingDate,
        'numberOfBookableSeats': numberOfBookableSeats,
        'itineraries': itineraries?.map((e) => e.toJson()).toList(),
        'price': price?.toJson(),
        'pricingOptions': pricingOptions?.toJson(),
        'validatingAirlineCodes': validatingAirlineCodes,
        'travelerPricings': travelerPricings?.map((e) => e.toJson()).toList(),
      };
}
