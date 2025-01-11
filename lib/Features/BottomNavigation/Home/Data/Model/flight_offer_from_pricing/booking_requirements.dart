import 'traveler_requirement.dart';

class BookingRequirements {
  bool? invoiceAddressRequired;
  bool? mailingAddressRequired;
  bool? emailAddressRequired;
  bool? phoneCountryCodeRequired;
  bool? mobilePhoneNumberRequired;
  bool? phoneNumberRequired;
  bool? postalCodeRequired;
  List<TravelerRequirement>? travelerRequirements;

  BookingRequirements({
    this.invoiceAddressRequired,
    this.mailingAddressRequired,
    this.emailAddressRequired,
    this.phoneCountryCodeRequired,
    this.mobilePhoneNumberRequired,
    this.phoneNumberRequired,
    this.postalCodeRequired,
    this.travelerRequirements,
  });

  factory BookingRequirements.fromJson(Map<String, dynamic> json) {
    return BookingRequirements(
      invoiceAddressRequired: json['invoiceAddressRequired'] as bool?,
      mailingAddressRequired: json['mailingAddressRequired'] as bool?,
      emailAddressRequired: json['emailAddressRequired'] as bool?,
      phoneCountryCodeRequired: json['phoneCountryCodeRequired'] as bool?,
      mobilePhoneNumberRequired: json['mobilePhoneNumberRequired'] as bool?,
      phoneNumberRequired: json['phoneNumberRequired'] as bool?,
      postalCodeRequired: json['postalCodeRequired'] as bool?,
      travelerRequirements: (json['travelerRequirements'] as List<dynamic>?)
          ?.map((e) => TravelerRequirement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'invoiceAddressRequired': invoiceAddressRequired,
        'mailingAddressRequired': mailingAddressRequired,
        'emailAddressRequired': emailAddressRequired,
        'phoneCountryCodeRequired': phoneCountryCodeRequired,
        'mobilePhoneNumberRequired': mobilePhoneNumberRequired,
        'phoneNumberRequired': phoneNumberRequired,
        'postalCodeRequired': postalCodeRequired,
        'travelerRequirements':
            travelerRequirements?.map((e) => e.toJson()).toList(),
      };
}
