class FlightRequest {
  Data? data;

  FlightRequest({this.data});

  FlightRequest.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? type;
  List<FlightOffers>? flightOffers;
  List<Travelers>? travelers;
  Remarks? remarks;
  TicketingAgreement? ticketingAgreement;
  List<Contacts>? contacts;

  Data(
      {this.type,
      this.flightOffers,
      this.travelers,
      this.remarks,
      this.ticketingAgreement,
      this.contacts});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['flightOffers'] != null) {
      flightOffers = <FlightOffers>[];
      json['flightOffers'].forEach((v) {
        flightOffers!.add(new FlightOffers.fromJson(v));
      });
    }
    if (json['travelers'] != null) {
      travelers = <Travelers>[];
      json['travelers'].forEach((v) {
        travelers!.add(new Travelers.fromJson(v));
      });
    }
    remarks =
        json['remarks'] != null ? new Remarks.fromJson(json['remarks']) : null;
    ticketingAgreement = json['ticketingAgreement'] != null
        ? new TicketingAgreement.fromJson(json['ticketingAgreement'])
        : null;
    if (json['contacts'] != null) {
      contacts = <Contacts>[];
      json['contacts'].forEach((v) {
        contacts!.add(new Contacts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.flightOffers != null) {
      data['flightOffers'] = this.flightOffers!.map((v) => v.toJson()).toList();
    }
    if (this.travelers != null) {
      data['travelers'] = this.travelers!.map((v) => v.toJson()).toList();
    }
    if (this.remarks != null) {
      data['remarks'] = this.remarks!.toJson();
    }
    if (this.ticketingAgreement != null) {
      data['ticketingAgreement'] = this.ticketingAgreement!.toJson();
    }
    if (this.contacts != null) {
      data['contacts'] = this.contacts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FlightOffers {
  String? type;
  String? id;
  String? source;
  bool? instantTicketingRequired;
  bool? nonHomogeneous;
  bool? oneWay;
  String? lastTicketingDate;
  int? numberOfBookableSeats;
  List<Itineraries>? itineraries;
  Price? price;
  PricingOptions? pricingOptions;
  List<String>? validatingAirlineCodes;
  List<TravelerPricings>? travelerPricings;

  FlightOffers(
      {this.type,
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
      this.travelerPricings});

  FlightOffers.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    source = json['source'];
    instantTicketingRequired = json['instantTicketingRequired'];
    nonHomogeneous = json['nonHomogeneous'];
    oneWay = json['oneWay'];
    lastTicketingDate = json['lastTicketingDate'];
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
  String? at;
  String? terminal;

  Departure({this.iataCode, this.at, this.terminal});

  Departure.fromJson(Map<String, dynamic> json) {
    iataCode = json['iataCode'];
    at = json['at'];
    terminal = json['terminal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iataCode'] = this.iataCode;
    data['at'] = this.at;
    data['terminal'] = this.terminal;
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
  TravelPrice? price;
  List<FareDetailsBySegment>? fareDetailsBySegment;

  TravelerPricings(
      {this.travelerId,
      this.fareOption,
      this.travelerType,
      this.price,
      this.fareDetailsBySegment});

  TravelerPricings.fromJson(Map<String, dynamic> json) {
    travelerId = json['travelerId'];
    fareOption = json['fareOption'];
    travelerType = json['travelerType'];
    price =
        json['price'] != null ? new TravelPrice.fromJson(json['price']) : null;
    if (json['fareDetailsBySegment'] != null) {
      fareDetailsBySegment = <FareDetailsBySegment>[];
      json['fareDetailsBySegment'].forEach((v) {
        fareDetailsBySegment!.add(new FareDetailsBySegment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['travelerId'] = this.travelerId;
    data['fareOption'] = this.fareOption;
    data['travelerType'] = this.travelerType;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    if (this.fareDetailsBySegment != null) {
      data['fareDetailsBySegment'] =
          this.fareDetailsBySegment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TravelPrice {
  String? grandTotal;
  String? billingCurrency;
  String? currency;
  String? total;
  String? base;
  List<Taxes>? taxes;

  TravelPrice(
      {this.grandTotal,
      this.billingCurrency,
      this.currency,
      this.total,
      this.base,
      this.taxes});

  TravelPrice.fromJson(Map<String, dynamic> json) {
    grandTotal = json['grandTotal'];
    billingCurrency = json['billingCurrency'];
    currency = json['currency'];
    total = json['total'];
    base = json['base'];
    if (json['taxes'] != null) {
      taxes = <Taxes>[];
      json['taxes'].forEach((v) {
        taxes!.add(new Taxes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grandTotal'] = this.grandTotal;
    data['billingCurrency'] = this.billingCurrency;
    data['currency'] = this.currency;
    data['total'] = this.total;
    data['base'] = this.base;
    if (this.taxes != null) {
      data['taxes'] = this.taxes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Taxes {
  String? amount;
  String? code;

  Taxes({this.amount, this.code});

  Taxes.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['code'] = this.code;
    return data;
  }
}

class FareDetailsBySegment {
  String? segmentId;
  String? cabin;
  String? fareBasis;
  String? classtype;
  IncludedCheckedBags? includedCheckedBags;

  FareDetailsBySegment(
      {this.segmentId,
      this.cabin,
      this.fareBasis,
      this.classtype,
      this.includedCheckedBags});

  FareDetailsBySegment.fromJson(Map<String, dynamic> json) {
    segmentId = json['segmentId'];
    cabin = json['cabin'];
    fareBasis = json['fareBasis'];
    classtype = json['class'];
    includedCheckedBags = json['includedCheckedBags'] != null
        ? new IncludedCheckedBags.fromJson(json['includedCheckedBags'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['segmentId'] = this.segmentId;
    data['cabin'] = this.cabin;
    data['fareBasis'] = this.fareBasis;
    data['class'] = this.classtype;
    if (this.includedCheckedBags != null) {
      data['includedCheckedBags'] = this.includedCheckedBags!.toJson();
    }
    return data;
  }
}

class IncludedCheckedBags {
  int? quantity;
  int? weight;
  String? weightUnit;

  IncludedCheckedBags({this.quantity, this.weight, this.weightUnit});

  IncludedCheckedBags.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    weight = json['weight'];
    weightUnit = json['weightUnit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['weight'] = this.weight;
    data['weightUnit'] = this.weightUnit;
    return data;
  }
}

// second param
class Travelers {
  String? id;
  String? dateOfBirth;
  String? gender;
  Contact? contact;

  Travelers({this.id, this.dateOfBirth, this.gender, this.contact});

  Travelers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    contact =
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateOfBirth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    return data;
  }
}

class Contact {
  String? emailAddress;
  List<Phones>? phones;

  Contact({this.emailAddress, this.phones});

  Contact.fromJson(Map<String, dynamic> json) {
    emailAddress = json['emailAddress'];
    if (json['phones'] != null) {
      phones = <Phones>[];
      json['phones'].forEach((v) {
        phones!.add(new Phones.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emailAddress'] = this.emailAddress;
    if (this.phones != null) {
      data['phones'] = this.phones!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Phones {
  String? deviceType;
  String? countryCallingCode;
  String? number;

  Phones({this.deviceType, this.countryCallingCode, this.number});

  Phones.fromJson(Map<String, dynamic> json) {
    deviceType = json['deviceType'];
    countryCallingCode = json['countryCallingCode'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deviceType'] = this.deviceType;
    data['countryCallingCode'] = this.countryCallingCode;
    data['number'] = this.number;
    return data;
  }
}

// third param
class Remarks {
  List<General>? general;

  Remarks({this.general});

  Remarks.fromJson(Map<String, dynamic> json) {
    if (json['general'] != null) {
      general = <General>[];
      json['general'].forEach((v) {
        general!.add(new General.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.general != null) {
      data['general'] = this.general!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class General {
  String? subType;
  String? text;

  General({this.subType, this.text});

  General.fromJson(Map<String, dynamic> json) {
    subType = json['subType'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subType'] = this.subType;
    data['text'] = this.text;
    return data;
  }
}

class TicketingAgreement {
  String? option;
  String? delay;

  TicketingAgreement({this.option, this.delay});

  TicketingAgreement.fromJson(Map<String, dynamic> json) {
    option = json['option'];
    delay = json['delay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['option'] = this.option;
    data['delay'] = this.delay;
    return data;
  }
}
// fourth param

class Contacts {
  AddresseeName? addresseeName;
  Address? address;
  String? language;
  String? purpose;
  List<Phones>? phones;
  String? companyName;
  String? emailAddress;
  List<String>? lines;
  String? postalCode;
  String? countryCode;
  String? cityName;
  String? stateName;
  String? postalBox;

  Contacts(
      {this.addresseeName,
      this.address,
      this.language,
      this.purpose,
      this.phones,
      this.companyName,
      this.emailAddress,
      this.lines,
      this.postalCode,
      this.countryCode,
      this.cityName,
      this.stateName,
      this.postalBox});

  Contacts.fromJson(Map<String, dynamic> json) {
    addresseeName = json['addresseeName'] != null
        ? new AddresseeName.fromJson(json['addresseeName'])
        : null;
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    language = json['language'];
    purpose = json['purpose'];
    if (json['phones'] != null) {
      phones = <Phones>[];
      json['phones'].forEach((v) {
        phones!.add(new Phones.fromJson(v));
      });
    }
    companyName = json['companyName'];
    emailAddress = json['emailAddress'];
    lines = json['lines'].cast<String>();
    postalCode = json['postalCode'];
    countryCode = json['countryCode'];
    cityName = json['cityName'];
    stateName = json['stateName'];
    postalBox = json['postalBox'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.addresseeName != null) {
      data['addresseeName'] = this.addresseeName!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['language'] = this.language;
    data['purpose'] = this.purpose;
    if (this.phones != null) {
      data['phones'] = this.phones!.map((v) => v.toJson()).toList();
    }
    data['companyName'] = this.companyName;
    data['emailAddress'] = this.emailAddress;
    data['lines'] = this.lines;
    data['postalCode'] = this.postalCode;
    data['countryCode'] = this.countryCode;
    data['cityName'] = this.cityName;
    data['stateName'] = this.stateName;
    data['postalBox'] = this.postalBox;
    return data;
  }
}

class AddresseeName {
  String? firstName;
  String? lastName;

  AddresseeName({this.firstName, this.lastName});

  AddresseeName.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    return data;
  }
}

class Address {
  List<String>? lines;
  String? postalCode;
  String? countryCode;
  String? cityName;
  String? stateName;
  String? postalBox;

  Address(
      {this.lines,
      this.postalCode,
      this.countryCode,
      this.cityName,
      this.stateName,
      this.postalBox});

  Address.fromJson(Map<String, dynamic> json) {
    lines = json['lines'].cast<String>();
    postalCode = json['postalCode'];
    countryCode = json['countryCode'];
    cityName = json['cityName'];
    stateName = json['stateName'];
    postalBox = json['postalBox'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lines'] = this.lines;
    data['postalCode'] = this.postalCode;
    data['countryCode'] = this.countryCode;
    data['cityName'] = this.cityName;
    data['stateName'] = this.stateName;
    data['postalBox'] = this.postalBox;
    return data;
  }
}
