import 'associated_record.dart';
import 'contact.dart';
import 'flight_offer.dart';
import 'form_of_payment.dart';
import 'remarks.dart';
import 'ticketing_agreement.dart';
import 'traveler.dart';

class CreateFlightOrder {
  String? type;
  String? id;
  String? reservationGuid;
  List<AssociatedRecord>? associatedRecords;
  List<FlightOffer>? flightOffers;
  List<Traveler>? travelers;
  Remarks? remarks;
  List<FormOfPayment>? formOfPayments;
  TicketingAgreement? ticketingAgreement;
  List<Contact>? contacts;

  CreateFlightOrder({
    this.type,
    this.id,
    this.reservationGuid,
    this.associatedRecords,
    this.flightOffers,
    this.travelers,
    this.remarks,
    this.formOfPayments,
    this.ticketingAgreement,
    this.contacts,
  });

  factory CreateFlightOrder.fromJson(Map<String, dynamic> json) {
    return CreateFlightOrder(
      type: json['type'] as String?,
      id: json['id'] as String?,
      reservationGuid: json['reservationGUID'] as String?,
      associatedRecords: (json['associatedRecords'] as List<dynamic>?)
          ?.map((e) => AssociatedRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      flightOffers: (json['flightOffers'] as List<dynamic>?)
          ?.map((e) => FlightOffer.fromJson(e as Map<String, dynamic>))
          .toList(),
      travelers: (json['travelers'] as List<dynamic>?)
          ?.map((e) => Traveler.fromJson(e as Map<String, dynamic>))
          .toList(),
      remarks: json['remarks'] == null
          ? null
          : Remarks.fromJson(json['remarks'] as Map<String, dynamic>),
      formOfPayments: (json['formOfPayments'] as List<dynamic>?)
          ?.map((e) => FormOfPayment.fromJson(e as Map<String, dynamic>))
          .toList(),
      ticketingAgreement: json['ticketingAgreement'] == null
          ? null
          : TicketingAgreement.fromJson(
              json['ticketingAgreement'] as Map<String, dynamic>),
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'id': id,
        'reservationGUID': reservationGuid,
        'associatedRecords': associatedRecords?.map((e) => e.toJson()).toList(),
        'flightOffers': flightOffers?.map((e) => e.toJson()).toList(),
        'travelers': travelers?.map((e) => e.toJson()).toList(),
        'remarks': remarks?.toJson(),
        'formOfPayments': formOfPayments?.map((e) => e.toJson()).toList(),
        'ticketingAgreement': ticketingAgreement?.toJson(),
        'contacts': contacts?.map((e) => e.toJson()).toList(),
      };
}
