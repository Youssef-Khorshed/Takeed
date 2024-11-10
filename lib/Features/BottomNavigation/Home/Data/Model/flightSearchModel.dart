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
        data!.add(new FlightSearchData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
        itineraries!.add(new Itineraries.fromJson(v));
      });
    }
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    pricingOptions = json['pricingOptions'] != null
        ? new PricingOptions.fromJson(json['pricingOptions'])
        : null;
    validatingAirlineCodes = json['validatingAirlineCodes'].cast<String>();
    if (json['travelerPricings'] != null) {
      travelerPricings = <TravelerPricings>[];
      json['travelerPricings'].forEach((v) {
        travelerPricings!.add(new TravelerPricings.fromJson(v));
      });
    }
    fareRules = json['fareRules'] != null
        ? new FareRules.fromJson(json['fareRules'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['source'] = this.source;
    data['instantTicketingRequired'] = this.instantTicketingRequired;
    data['nonHomogeneous'] = this.nonHomogeneous;
    data['oneWay'] = this.oneWay;
    data['lastTicketingDate'] = this.lastTicketingDate;
    data['lastTicketingDateTime'] = this.lastTicketingDateTime;
    data['numberOfBookableSeats'] = this.numberOfBookableSeats;
    if (this.itineraries != null) {
      data['itineraries'] = this.itineraries!.map((v) => v.toJson()).toList();
    }
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    if (this.pricingOptions != null) {
      data['pricingOptions'] = this.pricingOptions!.toJson();
    }
    data['validatingAirlineCodes'] = this.validatingAirlineCodes;
    if (this.travelerPricings != null) {
      data['travelerPricings'] =
          this.travelerPricings!.map((v) => v.toJson()).toList();
    }
    if (this.fareRules != null) {
      data['fareRules'] = this.fareRules!.toJson();
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
        segments!.add(new Segments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['duration'] = this.duration;
    if (this.segments != null) {
      data['segments'] = this.segments!.map((v) => v.toJson()).toList();
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
        ? new Departure.fromJson(json['departure'])
        : null;
    arrival = json['arrival'] != null
        ? new Departure.fromJson(json['arrival'])
        : null;
    aircraft = json['aircraft'] != null
        ? new Aircraft.fromJson(json['aircraft'])
        : null;
    operating = json['operating'] != null
        ? new Operating.fromJson(json['operating'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['numberOfStops'] = this.numberOfStops;
    data['blacklistedInEU'] = this.blacklistedInEU;
    data['carrierCode'] = this.carrierCode;
    data['number'] = this.number;
    data['duration'] = this.duration;
    if (this.departure != null) {
      data['departure'] = this.departure!.toJson();
    }
    if (this.arrival != null) {
      data['arrival'] = this.arrival!.toJson();
    }
    if (this.aircraft != null) {
      data['aircraft'] = this.aircraft!.toJson();
    }
    if (this.operating != null) {
      data['operating'] = this.operating!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iataCode'] = this.iataCode;
    data['terminal'] = this.terminal;
    data['at'] = this.at;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['carrierCode'] = this.carrierCode;
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
        fees!.add(new Fees.fromJson(v));
      });
    }
    refundableTaxes = json['refundableTaxes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grandTotal'] = this.grandTotal;
    data['currency'] = this.currency;
    data['total'] = this.total;
    data['base'] = this.base;
    if (this.fees != null) {
      data['fees'] = this.fees!.map((v) => v.toJson()).toList();
    }
    data['refundableTaxes'] = this.refundableTaxes;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['type'] = this.type;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['includedCheckedBagsOnly'] = this.includedCheckedBagsOnly;
    data['fareType'] = this.fareType;
    data['refundableFare'] = this.refundableFare;
    data['noRestrictionFare'] = this.noRestrictionFare;
    data['noPenaltyFare'] = this.noPenaltyFare;
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
    price = json['price'] != null
        ? new AdditionalPrice.fromJson(json['price'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['travelerId'] = this.travelerId;
    data['fareOption'] = this.fareOption;
    data['travelerType'] = this.travelerType;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grandTotal'] = this.grandTotal;
    data['currency'] = this.currency;
    data['total'] = this.total;
    data['base'] = this.base;
    data['refundableTaxes'] = this.refundableTaxes;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['weight'] = this.weight;
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
        rules!.add(new Rules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rules != null) {
      data['rules'] = this.rules!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['maxPenaltyAmount'] = this.maxPenaltyAmount;
    data['notApplicable'] = this.notApplicable;
    return data;
  }
}
