class Flightsearchmodel {
  int? statusCode;
  bool? parsed;
  TayarResult? tayarResult;
  String? message;

  Flightsearchmodel(
      {this.statusCode, this.parsed, this.tayarResult, this.message});

  Flightsearchmodel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['Message'];
    parsed = json['parsed'] ?? false;
    tayarResult = json['tayarResult'] != null
        ? TayarResult.fromJson(json['tayarResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['parsed'] = parsed;
    if (tayarResult != null) {
      data['tayarResult'] = tayarResult!.toJson();
    }
    return data;
  }
}

class TayarResult {
  List<FlightSearchData>? data;

  TayarResult({this.data});

  TayarResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FlightSearchData>[];
      json['data'].forEach((v) {
        data!.add(FlightSearchData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class FlightSearchData {
  String? type;
  String? id;
  String? source;
  bool? instantTicketingRequired;
  bool? nonHomogeneous;
  bool? oneWay;
  String? lastTicketingDate;
  String? lastTicketingDateTime;
  int? numberOfBookableSeats;
  List<Itineraries>? itineraries;

  Price? price;
  PricingOptions? pricingOptions;
  List<String>? validatingAirlineCodes;
  List<TravelerPricings>? travelerPricings;
  FareRules? fareRules;

  FlightSearchData(
      {this.type,
      this.id,
      this.source,
      this.instantTicketingRequired,
      this.nonHomogeneous,
      this.oneWay,
      this.lastTicketingDate,
      this.lastTicketingDateTime,
      this.numberOfBookableSeats,
      this.itineraries,
      this.price,
      this.pricingOptions,
      this.validatingAirlineCodes,
      this.travelerPricings,
      this.fareRules});

  FlightSearchData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    source = json['source'];
    instantTicketingRequired = json['instantTicketingRequired'];
    nonHomogeneous = json['nonHomogeneous'];
    oneWay = json['oneWay'];
    lastTicketingDate = json['lastTicketingDate'];
    lastTicketingDateTime = json['lastTicketingDateTime'];
    numberOfBookableSeats = json['numberOfBookableSeats'];
    if (json['itineraries'] != null) {
      itineraries = <Itineraries>[];
      json['itineraries'].forEach((v) {
        itineraries!.add(Itineraries.fromJson(v));
      });
    }
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    pricingOptions = json['pricingOptions'] != null
        ? PricingOptions.fromJson(json['pricingOptions'])
        : null;
    validatingAirlineCodes = json['validatingAirlineCodes'].cast<String>();
    if (json['travelerPricings'] != null) {
      travelerPricings = <TravelerPricings>[];
      json['travelerPricings'].forEach((v) {
        travelerPricings!.add(TravelerPricings.fromJson(v));
      });
    }
    fareRules = json['fareRules'] != null
        ? FareRules.fromJson(json['fareRules'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['source'] = source;
    data['instantTicketingRequired'] = instantTicketingRequired;
    data['nonHomogeneous'] = nonHomogeneous;
    data['oneWay'] = oneWay;
    data['lastTicketingDate'] = lastTicketingDate;
    data['lastTicketingDateTime'] = lastTicketingDateTime;
    data['numberOfBookableSeats'] = numberOfBookableSeats;
    if (itineraries != null) {
      data['itineraries'] = itineraries!.map((v) => v.toJson()).toList();
    }
    if (price != null) {
      data['price'] = price!.toJson();
    }
    if (pricingOptions != null) {
      data['pricingOptions'] = pricingOptions!.toJson();
    }
    data['validatingAirlineCodes'] = validatingAirlineCodes;
    if (travelerPricings != null) {
      data['travelerPricings'] =
          travelerPricings!.map((v) => v.toJson()).toList();
    }
    if (fareRules != null) {
      data['fareRules'] = fareRules!.toJson();
    }
    return data;
  }
}

class Itineraries {
  String? duration;
  List<Segments>? segments;

  Itineraries({this.duration, this.segments});

  Itineraries.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
    if (json['segments'] != null) {
      segments = <Segments>[];
      json['segments'].forEach((v) {
        segments!.add(Segments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['duration'] = duration;
    if (segments != null) {
      data['segments'] = segments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Segments {
  String? id;
  int? numberOfStops;
  bool? blacklistedInEU;
  String? carrierCode;
  String? number;
  String? duration;
  Departure? departure;
  Departure? arrival;
  Aircraft? aircraft;
  Operating? operating;

  Segments(
      {this.id,
      this.numberOfStops,
      this.blacklistedInEU,
      this.carrierCode,
      this.number,
      this.duration,
      this.departure,
      this.arrival,
      this.aircraft,
      this.operating});

  Segments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numberOfStops = json['numberOfStops'];
    blacklistedInEU = json['blacklistedInEU'];
    carrierCode = json['carrierCode'];
    number = json['number'];
    duration = json['duration'];
    departure = json['departure'] != null
        ? Departure.fromJson(json['departure'])
        : null;
    arrival =
        json['arrival'] != null ? Departure.fromJson(json['arrival']) : null;
    aircraft =
        json['aircraft'] != null ? Aircraft.fromJson(json['aircraft']) : null;
    operating = json['operating'] != null
        ? Operating.fromJson(json['operating'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['numberOfStops'] = numberOfStops;
    data['blacklistedInEU'] = blacklistedInEU;
    data['carrierCode'] = carrierCode;
    data['number'] = number;
    data['duration'] = duration;
    if (departure != null) {
      data['departure'] = departure!.toJson();
    }
    if (arrival != null) {
      data['arrival'] = arrival!.toJson();
    }
    if (aircraft != null) {
      data['aircraft'] = aircraft!.toJson();
    }
    if (operating != null) {
      data['operating'] = operating!.toJson();
    }
    return data;
  }
}

class Departure {
  String? iataCode;
  String? terminal;
  String? at;

  Departure({this.iataCode, this.terminal, this.at});

  Departure.fromJson(Map<String, dynamic> json) {
    iataCode = json['iataCode'];
    terminal = json['terminal'];
    at = json['at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iataCode'] = iataCode;
    data['terminal'] = terminal;
    data['at'] = at;
    return data;
  }
}

class Aircraft {
  String? code;

  Aircraft({this.code});

  Aircraft.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    return data;
  }
}

class Operating {
  String? carrierCode;

  Operating({this.carrierCode});

  Operating.fromJson(Map<String, dynamic> json) {
    carrierCode = json['carrierCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['carrierCode'] = carrierCode;
    return data;
  }
}

class Price {
  String? grandTotal;
  String? currency;
  String? total;
  String? base;
  List<Fees>? fees;
  String? refundableTaxes;

  Price(
      {this.grandTotal,
      this.currency,
      this.total,
      this.base,
      this.fees,
      this.refundableTaxes});

  Price.fromJson(Map<String, dynamic> json) {
    grandTotal = json['grandTotal'];
    currency = json['currency'];
    total = json['total'];
    base = json['base'];
    if (json['fees'] != null) {
      fees = <Fees>[];
      json['fees'].forEach((v) {
        fees!.add(Fees.fromJson(v));
      });
    }
    refundableTaxes = json['refundableTaxes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['grandTotal'] = grandTotal;
    data['currency'] = currency;
    data['total'] = total;
    data['base'] = base;
    if (fees != null) {
      data['fees'] = fees!.map((v) => v.toJson()).toList();
    }
    data['refundableTaxes'] = refundableTaxes;
    return data;
  }
}

class Fees {
  String? amount;
  String? type;

  Fees({this.amount, this.type});

  Fees.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['type'] = type;
    return data;
  }
}

class PricingOptions {
  bool? includedCheckedBagsOnly;
  List<String>? fareType;
  bool? refundableFare;
  bool? noRestrictionFare;
  bool? noPenaltyFare;

  PricingOptions(
      {this.includedCheckedBagsOnly,
      this.fareType,
      this.refundableFare,
      this.noRestrictionFare,
      this.noPenaltyFare});

  PricingOptions.fromJson(Map<String, dynamic> json) {
    includedCheckedBagsOnly = json['includedCheckedBagsOnly'];
    fareType = json['fareType'].cast<String>();
    refundableFare = json['refundableFare'];
    noRestrictionFare = json['noRestrictionFare'];
    noPenaltyFare = json['noPenaltyFare'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['includedCheckedBagsOnly'] = includedCheckedBagsOnly;
    data['fareType'] = fareType;
    data['refundableFare'] = refundableFare;
    data['noRestrictionFare'] = noRestrictionFare;
    data['noPenaltyFare'] = noPenaltyFare;
    return data;
  }
}

class TravelerPricings {
  String? travelerId;
  String? fareOption;
  String? travelerType;
  AdditionalPrice? price;

  TravelerPricings(
      {this.travelerId, this.fareOption, this.travelerType, this.price});

  TravelerPricings.fromJson(Map<String, dynamic> json) {
    travelerId = json['travelerId'];
    fareOption = json['fareOption'];
    travelerType = json['travelerType'];
    price =
        json['price'] != null ? AdditionalPrice.fromJson(json['price']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['travelerId'] = travelerId;
    data['fareOption'] = fareOption;
    data['travelerType'] = travelerType;
    if (price != null) {
      data['price'] = price!.toJson();
    }

    return data;
  }
}

class AdditionalPrice {
  String? grandTotal;
  String? currency;
  String? total;
  String? base;
  String? refundableTaxes;

  AdditionalPrice(
      {this.grandTotal,
      this.currency,
      this.total,
      this.base,
      this.refundableTaxes});

  AdditionalPrice.fromJson(Map<String, dynamic> json) {
    grandTotal = json['grandTotal'];
    currency = json['currency'];
    total = json['total'];
    base = json['base'];
    refundableTaxes = json['refundableTaxes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['grandTotal'] = grandTotal;
    data['currency'] = currency;
    data['total'] = total;
    data['base'] = base;
    data['refundableTaxes'] = refundableTaxes;
    return data;
  }
}

class IncludedCheckedBags {
  int? quantity;
  int? weight;

  IncludedCheckedBags({this.quantity, this.weight});

  IncludedCheckedBags.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quantity'] = quantity;
    data['weight'] = weight;
    return data;
  }
}

class FareRules {
  List<Rules>? rules;

  FareRules({this.rules});

  FareRules.fromJson(Map<String, dynamic> json) {
    if (json['rules'] != null) {
      rules = <Rules>[];
      json['rules'].forEach((v) {
        rules!.add(Rules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rules != null) {
      data['rules'] = rules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rules {
  String? category;
  String? maxPenaltyAmount;
  bool? notApplicable;

  Rules({this.category, this.maxPenaltyAmount, this.notApplicable});

  Rules.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    maxPenaltyAmount = json['maxPenaltyAmount'];
    notApplicable = json['notApplicable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['maxPenaltyAmount'] = maxPenaltyAmount;
    data['notApplicable'] = notApplicable;
    return data;
  }
}
